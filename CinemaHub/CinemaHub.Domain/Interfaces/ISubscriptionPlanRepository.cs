using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface ISubscriptionPlanRepository
    {
        Task<List<SubscriptionPlan>> ViewAllSubscriptionPendingAsync();
        Task<List<SubscriptionPlan>> ViewAllSubscriptionPlanStatusAsync(bool status);
        Task<SubscriptionPlan> ViewSubscriptionPlanByIdAsync(int plainId);
        void CreateNewSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan);
        void UpdateSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan);
        void RemoveSubscriptionPlanAsync(SubscriptionPlan subscriptionPlan);
    }
}
