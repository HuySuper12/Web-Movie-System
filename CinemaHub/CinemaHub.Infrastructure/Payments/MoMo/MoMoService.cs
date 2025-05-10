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
using System.Text.Json;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.MoMo
{
    public class MoMoService : IMoMoService
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ISubscriptionPlanRepository _subscriptionPlanRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;
        private readonly IConfiguration _configuration;
        private static readonly HttpClient client = new HttpClient();
        private readonly IMediator _mediator;

        public MoMoService(IPaymentRepository paymentRepository, IAccountRepository accountRepository, ISubscriptionPlanRepository subscriptionPlanRepository, IUnitOfWork unitOfWork, IResponseCache responseCache, IConfiguration configuration, IMediator mediator)
        {
            _paymentRepository = paymentRepository;
            _accountRepository = accountRepository;
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
            _configuration = configuration;
            _mediator = mediator;
        }

        public async Task<string> CreateMoMoURL(PaymentInformation paymentInfo)
        {
            try
            {
                var _momoUrl = _configuration["MoMo:MomoUrl"];
                var _momoAccessKey = _configuration["MoMo:MomoAccessKey"];
                var _momoSecretKey = _configuration["MoMo:MomoSecretKey"];
                var _momoReturnUrl = _configuration["MoMo:MomoReturnUrl"];
                var _momoIPNUrl = _configuration["MoMo:MomoIPNUrl"];

                // Lấy thông tin account và plan
                var account = await _accountRepository.ViewProfileByEmailAsync(paymentInfo.UserEmail);
                var plan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(paymentInfo.SubscriptionPlanId);

                // Tạo payment
                var payment = new Payment
                {
                    PaymentCode = Guid.NewGuid().ToString(),
                    UserId = account.Id,
                    SubscriptionPlanId = paymentInfo.SubscriptionPlanId,
                    PaymentDate = DateTime.Now,
                    Amount = paymentInfo.Amount,
                    PaymentMethod = "MoMo",
                    PaymentStatus = "Pending",
                    ExpiryDate = DateTime.Now.AddDays(paymentInfo.ExpiryDate)
                };
                _paymentRepository.CreateNewPaymentAsync(payment);
                await _unitOfWork.SaveChangesAsync();

                var request = new MoMoInformation()
                {
                    orderInfo = $"Thanh toán gói {plan.PlanName}",
                    partnerCode = "MOMO",
                    redirectUrl = _momoReturnUrl,                  // URL quay lại sau khi thanh toán
                    ipnUrl = _momoIPNUrl,                          // URL nhận thông báo trạng thái thanh toán
                    orderId = payment.PaymentCode,                      // Mã đơn hàng
                    requestId = payment.PaymentCode,                    // ID yêu cầu thanh toán (mới mỗi lần)
                    amount = (long)payment.Amount,                      // Số tiền thanh toán
                    requestType = "payWithATM",                         // Loại phương thức thanh toán (có thể là "ATM Card", "Credit Card",...)
                    partnerName = "MoMo Payment",                       // Tên đối tác (tên của bạn hoặc dịch vụ MoMo)
                    storeId = $"Thanh toán gói {plan.PlanName}",        // Tên của cửa hàng hoặc gói dịch vụ 
                    autoCapture = true,                                 // Tự động bắt giao dịch sau khi thanh toán thành công
                    lang = "vi",                                        // Ngôn ngữ của giao diện MoMo
                    orderGroupId = "",
                    extraData = ""
                };

                // Tạo rawSignature (chữ ký) theo chuẩn yêu cầu của MoMo
                var rawSignature = $"accessKey={_momoAccessKey}&amount={payment.Amount}&extraData={request.extraData}&ipnUrl={request.ipnUrl}&orderId={request.orderId}&orderInfo={request.orderInfo}&partnerCode={request.partnerCode}&redirectUrl={request.redirectUrl}&requestId={request.requestId}&requestType={request.requestType}";


                // Tạo chữ ký sử dụng hàm getSignature
                request.signature = new MoMoLibrary().getSignature(rawSignature, _momoSecretKey);

                // Gửi yêu cầu đến MoMo API
                StringContent httpContent = new StringContent(JsonSerializer.Serialize(request), System.Text.Encoding.UTF8, "application/json");


                // Gửi yêu cầu POST đến MoMo API
                var quickPayResponse = await client.PostAsync(_momoUrl, httpContent);
                var responseContent = await quickPayResponse.Content.ReadAsStringAsync();

                // Kiểm tra mã trạng thái HTTP
                if (quickPayResponse.IsSuccessStatusCode)
                {
                    // Xử lý phản hồi nếu thành công
                    var responseObject = JsonSerializer.Deserialize<Dictionary<string, object>>(responseContent);
                    if (responseObject != null && responseObject.TryGetValue("payUrl", out var payUrl))
                    {
                        return payUrl?.ToString();
                    }
                }
                return "";
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return "";
            }
        }

        public async Task<bool> MoMoIpnUrl(Dictionary<string, string> queryParams)
        {
            MoMoLibrary momo = new MoMoLibrary();

            string partnerCode = queryParams["partnerCode"];
            string paymentCode = queryParams["orderId"];
            string requestId = queryParams["requestId"];
            decimal amount = Convert.ToDecimal(queryParams["amount"]);
            string orderInfo = queryParams["orderInfo"];
            string orderType = queryParams["orderType"];
            string transId = queryParams["transId"];
            string resultCode = queryParams["resultCode"];
            string message = queryParams["message"];
            string payType = queryParams["payType"];
            string signature = queryParams["signature"];

            var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);
            if (resultCode == "0" && message == "Successful.")
            {
                payment.PaymentStatus = "Success";
                _paymentRepository.UpdatePaymentAsync(payment);
                await _unitOfWork.SaveChangesAsync();

                await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
                await _responseCache.DeleteKeyInRedis("Payment");

                //await _jobService.EnqueueSendEmailAfterPayment(payment);
                return true;
            }
            payment.PaymentStatus = "Fail";
            _paymentRepository.UpdatePaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            await _responseCache.DeleteKeyInRedis("Payment");
            return false;
        }

        public async Task<Payment> MoMoReturnUrl(Dictionary<string, string> queryParams)
        {
            MoMoLibrary momo = new MoMoLibrary();

            string partnerCode = queryParams["partnerCode"];
            string paymentCode = queryParams["orderId"];
            string requestId = queryParams["requestId"];
            decimal amount = Convert.ToDecimal(queryParams["amount"]);
            string orderInfo = queryParams["orderInfo"];
            string orderType = queryParams["orderType"];
            string transId = queryParams["transId"];
            string resultCode = queryParams["resultCode"];
            string message = queryParams["message"];
            string payType = queryParams["payType"];
            string signature = queryParams["signature"];

            var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);
            if (resultCode == "0" && message == "Successful.")
            {
                payment.PaymentStatus = "Success";
                _paymentRepository.UpdatePaymentAsync(payment);
                await _unitOfWork.SaveChangesAsync();

                //await _mediator.Publish(new BillPaymentEvent(payment)); 
                await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
                await _responseCache.DeleteKeyInRedis("Payment");
                return payment;
            }
            payment.PaymentStatus = "Fail";
            _paymentRepository.UpdatePaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            await _responseCache.DeleteKeyInRedis("Payment");
            return null;
        }

        public class MoMoInformation
        {
            public string orderInfo { get; set; }
            public string partnerCode { get; set; }
            public string redirectUrl { get; set; }
            public string ipnUrl { get; set; }
            public long amount { get; set; }
            public string orderId { get; set; }
            public string requestId { get; set; }
            public string extraData { get; set; }
            public string partnerName { get; set; }
            public string storeId { get; set; }
            public string requestType { get; set; }
            public string orderGroupId { get; set; }
            public bool autoCapture { get; set; }
            public string lang { get; set; }
            public string signature { get; set; }
        }
    }
}
