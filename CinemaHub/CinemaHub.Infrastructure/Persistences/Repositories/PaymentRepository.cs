using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class PaymentRepository : IPaymentRepository
    {
        private CinemaHubContext _context;

        public PaymentRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public async Task<bool> CheckPaymentFreeTrialAsync(Payment payment)
        {
            var result = await _context.Payments.Where(p => p.PaymentStatus.ToLower() == "success" && p.SubscriptionPlanId == 4 && p.UserId == payment.UserId).FirstOrDefaultAsync();
            if (result == null)
            {
                return false;
            }
            return true;
        }

        public void CreateNewPaymentAsync(Payment payment)
        {
            _context.Payments.Add(payment);
        }

        public Dictionary<string, decimal> GetRevenuePaymentStatistics()
        {
            var statistics = _context.Payments
            .Where(transaction => transaction.PaymentDate.HasValue && transaction.PaymentStatus == "Success")
            .GroupBy(transaction => new { Year = transaction.PaymentDate.Value.Year, Month = transaction.PaymentDate.Value.Month })
            .ToDictionary(
                g => $"{g.Key.Year}-{g.Key.Month}",     // Key: Năm và tháng
                g => GetRevenueSystem(g.ToList())       // Value: Doanh thu theo thang
            );

            return statistics;
        }

        public decimal GetRevenueSystem(List<Payment> payments)
        {
            decimal totalRevenue = 0;
            foreach (var payment in payments)
            {
                totalRevenue += payment.Amount;
            }
            return totalRevenue;
        }

        public void UpdatePaymentAsync(Payment payment)
        {
            _context.Payments.Update(payment);
        }

        public async Task<List<Payment>> ViewAllPaymentAsync(int pageSize, string paymentId)
        {
            var query = _context.Payments.AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(paymentId))
            {
                query = query.Where(payment => payment.PaymentId < int.Parse(paymentId)).OrderByDescending(p => p.PaymentId);
            }

            return await query.Include("SubscriptionPlan").Take(pageSize).ToListAsync();
        }

        public async Task<List<Payment>> ViewAllPaymentMethodAsync(string paymentMethod)
        {
            return await _context.Payments.Where(x => x.PaymentMethod.ToLower() == paymentMethod.ToLower()).Include("SubscriptionPlan").AsNoTracking().ToListAsync();
        }

        public async Task<List<Payment>> ViewAllPaymentStatusAsync(string status)
        {
            return await _context.Payments.Where(p => p.PaymentStatus == status).AsNoTracking().ToListAsync();
        }

        public async Task<Payment> ViewLastedPaymentExpiredAsync(Payment payment)
        {
            return await _context.Payments.Where(p => p.PaymentStatus.ToLower() == "success" && p.ExpiryDate > DateTime.Now && p.UserId == payment.UserId).OrderByDescending(p => p.PaymentId).Include("SubscriptionPlan").AsNoTracking().FirstOrDefaultAsync();
        }

        public async Task<Payment> ViewPaymentByIdAsync(int paymentId)
        {
            return await _context.Payments.Include("SubscriptionPlan").AsNoTracking().FirstOrDefaultAsync(x => x.PaymentId == paymentId);
        }

        public async Task<Payment> ViewPaymentByPaymentCodeAsync(string paymentCode)
        {
            return await _context.Payments.AsNoTracking().FirstOrDefaultAsync(x => x.PaymentCode == paymentCode);
        }

        public async Task<List<Payment>> ViewPaymentByUserIdAsync(Payment payment, int pageSize, string paymentId)
        {
            var query = _context.Payments.Where(x => x.UserId == payment.UserId).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(paymentId))
            {
                query = query.Where(payment => payment.PaymentId < int.Parse(paymentId)).OrderByDescending(p => p.PaymentId);
            }

            return await query.Include("SubscriptionPlan").Take(pageSize).ToListAsync();
        }
    }
}
