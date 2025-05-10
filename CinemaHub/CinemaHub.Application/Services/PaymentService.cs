using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class PaymentService : IPaymentService
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IWatchHistoryRepository _watchHistoryRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;

        public PaymentService(IPaymentRepository paymentRepository, IAccountRepository accountRepository, IWatchHistoryRepository watchHistoryRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _paymentRepository = paymentRepository;
            _accountRepository = accountRepository;
            _watchHistoryRepository = watchHistoryRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> CheckPaymentFreeTrialFromAPIAsync(string email)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var payments = await _paymentRepository.CheckPaymentFreeTrialAsync(new Payment() { UserId = account.Id });
            if (payments)
            {
                return Result.Ok(true);
            }
            return Result.Ok(false);
        }

        public async Task<Result<List<StatisticSystemResponse>>> GetStatisticSystemFromAPIAsync()
        {
            var totalView = _watchHistoryRepository.GetTotalViewStatistics();
            var totalPayment = _paymentRepository.GetRevenuePaymentStatistics();

            // Duyệt qua từng phần tử và ghép dữ liệu
            var statistics = new List<StatisticSystemResponse>();
            foreach (var viewEntry in totalView)
            {
                var key = viewEntry.Key; // Tên thống kê
                var totalViewCount = viewEntry.Value;

                // Tìm giá trị tương ứng trong totalPayment
                totalPayment.TryGetValue(key, out var totalRevenue);

                // Tạo đối tượng thống kê
                var statistic = new StatisticSystemResponse
                {
                    Name = key,
                    TotalView = totalViewCount,
                    TotalRevenue = totalRevenue
                };

                statistics.Add(statistic);
            }
            return Result.Ok(statistics);
        }

        public async Task<Result<int>> GetTotalRevenueFromAPIAsync()
        {
            var payments = await _paymentRepository.ViewAllPaymentStatusAsync("success");
            if (payments.Count == 0)
            {
                return Result.Fail<int>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(payments.Sum(p => (int)p.Amount));
        }

        public async Task<Result<List<Payment>>> ViewAllPaymentFromAPIAsync(int pageSize, string paymentId)
        {
            var list = await _paymentRepository.ViewAllPaymentAsync(pageSize, paymentId);
            if (list.Count() == 0)
            {
                return Result.Fail<List<Payment>>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(list);
        }

        public async Task<Result<List<Payment>>> ViewAllPaymentMethodFromAPIAsync(string paymentMethod)
        {
            var list = await _paymentRepository.ViewAllPaymentMethodAsync(paymentMethod);
            if (list.Count() == 0)
            {
                return Result.Fail<List<Payment>>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(list);
        }

        public async Task<Result<List<Payment>>> ViewAllPaymentStatusFromAPIAsync(string status)
        {
            var list = await _paymentRepository.ViewAllPaymentStatusAsync(status);
            if (list.Count() == 0)
            {
                return Result.Fail<List<Payment>>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(list);
        }

        public async Task<Result<Payment>> ViewLastedPaymentExpiredFromAPIAsync(string email)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<Payment>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var payments = await _paymentRepository.ViewLastedPaymentExpiredAsync(new Payment() { UserId = account.Id });
            if (payments == null)
            {
                return Result.Fail<Payment>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(payments);
        }

        public async Task<Result<Payment>> ViewPaymentByIdFromAPIAsync(int id)
        {
            var payment = await _paymentRepository.ViewPaymentByIdAsync(id);
            if (payment == null)
            {
                return Result.Fail<Payment>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(payment);
        }

        public async Task<Result<List<Payment>>> ViewPaymentByUserIdFromAPIAsync(string email, int pageSize, string paymentId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Payment>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var list = await _paymentRepository.ViewPaymentByUserIdAsync(new Payment() { UserId = account.Id }, pageSize, paymentId);
            if (list.Count() == 0)
            {
                return Result.Fail<List<Payment>>(new Error("Payment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(list);
        }
    }
}
