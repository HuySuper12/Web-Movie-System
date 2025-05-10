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
    public class SubscriptionPlanRepository : ISubscriptionPlanRepository
    {
        private readonly CinemaHubContext _context;

        public SubscriptionPlanRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void CreateNewSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan)
        {
            _context.SubscriptionPlans.Add(subscriptionPlan);
        }

        public void RemoveSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan)
        {
            _context.SubscriptionPlans.Remove(subscriptionPlan);
        }

        public void UpdateSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan)
        {
            _context.SubscriptionPlans.Update(subscriptionPlan);
        }

        public async Task<List<SubscriptionPlan>> ViewAllSubscriptionPendingAsync()
        {
            return await _context.SubscriptionPlans.Where(x => x.IsActive == null).AsNoTracking().ToListAsync();
        }

        public async Task<List<SubscriptionPlan>> ViewAllSubscriptionPlanStatusAsync(bool status)
        {
            return await _context.SubscriptionPlans.Where(x => x.IsActive == status).OrderBy(x => x.Duration).AsNoTracking().ToListAsync();
        }

        public async Task<SubscriptionPlan> ViewSubscriptionPlanByIdAsync(int plainId)
        {
            return await _context.SubscriptionPlans.AsNoTracking().FirstOrDefaultAsync(x => x.PlanId == plainId);
        }
    }
}
