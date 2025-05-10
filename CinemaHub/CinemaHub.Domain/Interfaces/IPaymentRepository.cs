using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IPaymentRepository
    {
        Task<List<Payment>> ViewAllPaymentAsync(int pageSize, string paymentId);
        Task<List<Payment>> ViewAllPaymentStatusAsync(string status);
        Task<List<Payment>> ViewAllPaymentMethodAsync(string paymentMethod);
        Task<Payment> ViewPaymentByIdAsync(int paymentId);
        Task<Payment> ViewPaymentByPaymentCodeAsync(string paymentCode);
        Task<List<Payment>> ViewPaymentByUserIdAsync(Payment payment, int pageSize, string paymentId);
        Task<bool> CheckPaymentFreeTrialAsync(Payment payment);
        Task<Payment> ViewLastedPaymentExpiredAsync(Payment payment);
        void CreateNewPaymentAsync(Payment payment);
        void UpdatePaymentAsync(Payment payment);
        Dictionary<string, decimal> GetRevenuePaymentStatistics();
    }
}
