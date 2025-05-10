using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IPaymentService
    {
        Task<Result<List<Payment>>> ViewAllPaymentFromAPIAsync(int pageSize, string paymentId);
        Task<Result<List<Payment>>> ViewAllPaymentStatusFromAPIAsync(string status);
        Task<Result<List<Payment>>> ViewAllPaymentMethodFromAPIAsync(string paymentMethod);
        Task<Result<Payment>> ViewPaymentByIdFromAPIAsync(int id);
        Task<Result<List<Payment>>> ViewPaymentByUserIdFromAPIAsync(string email, int pageSize, string paymentId);
        Task<Result<Payment>> ViewLastedPaymentExpiredFromAPIAsync(string email);
        Task<Result<bool>> CheckPaymentFreeTrialFromAPIAsync(string email);
        Task<Result<int>> GetTotalRevenueFromAPIAsync();
        Task<Result<List<StatisticSystemResponse>>> GetStatisticSystemFromAPIAsync();
    }
}
