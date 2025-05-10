using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Domain.Interfaces;
using MediatR;
using Microsoft.Extensions.Configuration;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.PayPal
{
    public class PayPalService : IPayPalService
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ISubscriptionPlanRepository _subscriptionPlanRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;
        private readonly IConfiguration _configuration;
        private static readonly HttpClient client = new HttpClient();
        private readonly IMediator _mediator;

        public PayPalService(IPaymentRepository paymentRepository, IAccountRepository accountRepository, ISubscriptionPlanRepository subscriptionPlanRepository, IUnitOfWork unitOfWork, IResponseCache responseCache, IConfiguration configuration, IMediator mediator)
        {
            _paymentRepository = paymentRepository;
            _accountRepository = accountRepository;
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
            _configuration = configuration;
            _mediator = mediator;
        }

        public async Task<string> CreatePayment(PaymentInformation paymentInformation)
        {
            var clientId = _configuration["PayPal:ClientId"];
            var clientSecret = _configuration["PayPal:ClientSecret"];

            var apiContext = new APIContext(new OAuthTokenCredential(clientId, clientSecret).GetAccessToken());

            var subscriptionPlan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(paymentInformation.SubscriptionPlanId);
            var account = await _accountRepository.ViewProfileByEmailAsync(paymentInformation.UserEmail);

            var paymentDetail = new CinemaHub.Domain.Entities.Payment
            {
                PaymentCode = Guid.NewGuid().ToString(),
                UserId = account.Id,
                SubscriptionPlanId = paymentInformation.SubscriptionPlanId,
                PaymentDate = DateTime.Now,
                Amount = paymentInformation.Amount,
                PaymentMethod = "PayPal",
                PaymentStatus = "Pending",
                ExpiryDate = DateTime.Now.AddDays(paymentInformation.ExpiryDate)
            };
            _paymentRepository.CreateNewPaymentAsync(paymentDetail);
            await _unitOfWork.SaveChangesAsync();

            var payment = new Payment
            {
                intent = "sale",
                payer = new Payer { payment_method = "paypal" },
                transactions = new List<Transaction>
            {
                new Transaction
                {
                    amount = new Amount { total = $"{paymentInformation.Amount / 25000}", currency = "USD" },
                    description = $"Thanh toan goi {subscriptionPlan.PlanName}",
                    invoice_number = paymentDetail.PaymentCode,
                }
            },
                redirect_urls = new RedirectUrls
                {
                    return_url = $"https://localhost:7182/api/PayPal/success-payment/{paymentDetail.PaymentCode}",
                    cancel_url = $"https://localhost:7182/api/PayPal/fail-payment/{paymentDetail.PaymentCode}"
                }
            };

            var createdPayment = payment.Create(apiContext);
            var approvalUrl = createdPayment.links.FirstOrDefault(link => link.rel == "approval_url")?.href;

            return approvalUrl;
        }

        public async Task<bool> FailPayment(string paymentCode)
        {
            var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);

            if (payment == null)
            {
                return false;
            }

            payment.PaymentStatus = "Fail";
            _paymentRepository.UpdatePaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            await _responseCache.DeleteKeyInRedis("Payment");
            return true;
        }

        public async Task<Domain.Entities.Payment> SuccessPayment(string paymentCode)
        {
            var payment = await _paymentRepository.ViewPaymentByPaymentCodeAsync(paymentCode);

            if (payment == null)
            {
                return null;
            }

            payment.PaymentStatus = "Success";
            _paymentRepository.UpdatePaymentAsync(payment);
            await _unitOfWork.SaveChangesAsync();

            //await _mediator.Publish(new BillPaymentEvent(payment));
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            await _responseCache.DeleteKeyInRedis("Payment");
            return payment;
        }
    }
}
