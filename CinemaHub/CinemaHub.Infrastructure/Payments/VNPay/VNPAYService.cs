using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using MediatR;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.VNPay
{
    public class VNPAYService : IVNPAYService
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ISubscriptionPlanRepository _subscriptionPlanRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;
        private readonly IConfiguration _configuration;
        private readonly Utils _utils;
        private readonly IMediator _mediator;

        public VNPAYService(IPaymentRepository paymentRepository, IAccountRepository accountRepository, ISubscriptionPlanRepository subscriptionPlanRepository, IUnitOfWork unitOfWork, IResponseCache responseCache, IConfiguration configuration, Utils utils, IMediator mediator)
        {
            _paymentRepository = paymentRepository;
            _accountRepository = accountRepository;
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
            _configuration = configuration;
            _utils = utils;
            _mediator = mediator;
        }

        public async Task<string> CreateVNPAYURL(PaymentInformation paymentInfo)
        {
            var vnp_ReturnUrl = _configuration["VNPAY:VnPayReturnUrl"];  //URL nhan ket qua tra ve 
            var vnp_Url = _configuration["VNPAY:VnPayUrl"];              //URL thanh toan cua VNPAY 
            var vnp_TmnCode = _configuration["VNPAY:VnPayTmnCode"];      //Ma website
            var vnp_HashSecret = _configuration["VNPAY:VnPayHashSecret"];//Chuoi bi mat

            if (string.IsNullOrEmpty(vnp_TmnCode) || string.IsNullOrEmpty(vnp_HashSecret))
            {
                throw new InvalidOperationException("Vui lòng cấu hình các tham số: vnp_TmnCode và vnp_HashSecret.");
            }

            // Tạo đối tượng Payment
            var account = await _accountRepository.ViewProfileByEmailAsync(paymentInfo.UserEmail);
            var plan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(paymentInfo.SubscriptionPlanId);
            var payment = new Payment
            {
                PaymentCode = Guid.NewGuid().ToString(), // Tạo mã giao dịch duy nhất
                UserId = account.Id,
                SubscriptionPlanId = paymentInfo.SubscriptionPlanId,
                PaymentDate = DateTime.Now,
                Amount = paymentInfo.Amount,
                PaymentMethod = "VNPAY",
                PaymentStatus = "Pending", // Đang chờ thanh toán
                ExpiryDate = DateTime.Now.AddDays(paymentInfo.ExpiryDate)
            };

            // Lưu vào database
            _paymentRepository.CreateNewPaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            // Khởi tạo VNPAYLibrary
            var vnpay = new VNPAYLibrary();
            vnpay.AddRequestData("vnp_Version", "2.1.0");
            vnpay.AddRequestData("vnp_Command", "pay");
            vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);
            vnpay.AddRequestData("vnp_Amount", (payment.Amount * 100).ToString());
            vnpay.AddRequestData("vnp_CreateDate", payment.PaymentDate?.ToString("yyyyMMddHHmmss"));
            vnpay.AddRequestData("vnp_CurrCode", "VND");
            vnpay.AddRequestData("vnp_IpAddr", _utils.GetIpAddress());
            vnpay.AddRequestData("vnp_Locale", "vn");
            vnpay.AddRequestData("vnp_OrderInfo", $"Thanh toán gói {plan.PlanName}");
            vnpay.AddRequestData("vnp_OrderType", "billpayment");
            vnpay.AddRequestData("vnp_ReturnUrl", vnp_ReturnUrl);
            vnpay.AddRequestData("vnp_TxnRef", payment.PaymentCode); //Ma giao dich

            // Tạo URL thanh toán
            string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
            return paymentUrl;
        }

        public async Task<Payment> ReturnURL(Dictionary<string, string> queryParams)
        {
            var vnp_HashSecret = _configuration["VNPAY:VnPayHashSecret"]; // Chuỗi bí mật
            VNPAYLibrary vnpay = new VNPAYLibrary();

            // Lấy tất cả tham số có prefix "vnp_"
            foreach (var param in queryParams)
            {
                if (!string.IsNullOrEmpty(param.Key) && param.Key.StartsWith("vnp_"))
                {
                    vnpay.AddResponseData(param.Key, param.Value);
                }
            }

            // Lấy thông tin từ query string
            string paymentCode = vnpay.GetResponseData("vnp_TxnRef");   //Ma giao dich
            string vnpayTranId = vnpay.GetResponseData("vnp_TransactionNo");
            string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode"); //Trang thai thanh toan
            string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus"); //Trang thai thanh toan
            string vnp_SecureHash = queryParams.ContainsKey("vnp_SecureHash") ? queryParams["vnp_SecureHash"] : null;
            string terminalID = queryParams.ContainsKey("vnp_TmnCode") ? queryParams["vnp_TmnCode"] : null;
            long vnp_Amount = Convert.ToInt64(vnpay.GetResponseData("vnp_Amount")) / 100;
            string bankCode = queryParams.ContainsKey("vnp_BankCode") ? queryParams["vnp_BankCode"] : null; //Ma ngan hang

            // Kiểm tra chữ ký
            bool isSignatureValid = vnpay.ValidateSignature(vnp_SecureHash, vnp_HashSecret);

            var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);
            if (!isSignatureValid)
            {
                return null;
            }

            if (vnp_ResponseCode == "00" && vnp_TransactionStatus == "00")
            {
                payment.PaymentStatus = "Success";
                _paymentRepository.UpdatePaymentAsync(payment);
                await _unitOfWork.SaveChangesAsync();

                //await _mediator.Publish(new BillPaymentEvent(payment));
                await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
                await _responseCache.DeleteKeyInRedis("Payment");
                return payment; //Dua ve trang thanh cong
            }

            payment.PaymentStatus = "Fail";
            _paymentRepository.UpdatePaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            await _responseCache.DeleteKeyInRedis("Payment");
            return null; //Dua ve trang that bai 
        }

        public async Task<bool> VnPayIpnUrl(Dictionary<string, string> queryParams)
        {
            try
            {
                var vnp_HashSecret = _configuration["VNPAY:VnPayHashSecret"]; // Chuỗi bí mật
                VNPAYLibrary vnpay = new VNPAYLibrary();

                // Lấy tất cả tham số có prefix "vnp_"
                foreach (var param in queryParams)
                {
                    if (!string.IsNullOrEmpty(param.Key) && param.Key.StartsWith("vnp_"))
                    {
                        vnpay.AddResponseData(param.Key, param.Value);
                    }
                }

                // Lấy thông tin từ query string
                string paymentCode = vnpay.GetResponseData("vnp_TxnRef");
                string vnpayTranId = vnpay.GetResponseData("vnp_TransactionNo");
                string vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
                string vnp_TransactionStatus = vnpay.GetResponseData("vnp_TransactionStatus");
                string vnp_SecureHash = queryParams.ContainsKey("vnp_SecureHash") ? queryParams["vnp_SecureHash"] : null;
                string terminalID = queryParams.ContainsKey("vnp_TmnCode") ? queryParams["vnp_TmnCode"] : null;
                long vnp_Amount = Convert.ToInt64(vnpay.GetResponseData("vnp_Amount")) / 100;
                string bankCode = queryParams.ContainsKey("vnp_BankCode") ? queryParams["vnp_BankCode"] : null;

                // Xác thực chữ ký
                bool isSignatureValid = vnpay.ValidateSignature(vnp_SecureHash, vnp_HashSecret);

                if (!isSignatureValid)
                {
                    return false;
                }

                // Lấy thông tin đơn hàng
                var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);
                if (payment == null)
                {
                    payment.PaymentStatus = "Fail";
                    _paymentRepository.UpdatePaymentAsync(payment);
                    await _unitOfWork.SaveChangesAsync();
                    return false;
                }

                if (payment.Amount != vnp_Amount)
                {
                    payment.PaymentStatus = "Fail";
                    _paymentRepository.UpdatePaymentAsync(payment);
                    await _unitOfWork.SaveChangesAsync();
                    return false;
                }

                // Cập nhật trạng thái đơn hàng
                if (vnp_ResponseCode == "00" && vnp_TransactionStatus == "00")
                {
                    payment.PaymentStatus = "Success";
                    _paymentRepository.UpdatePaymentAsync(payment);
                    await _unitOfWork.SaveChangesAsync();
                    return true;
                }
                else
                {
                    payment.PaymentStatus = "Fail";
                    _paymentRepository.UpdatePaymentAsync(payment);
                    await _unitOfWork.SaveChangesAsync();
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
