using CinemaHub.Application.DTOs.Request;
using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface ISubscriptionPlanService
    {
        Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPendingFromAPIAsync();
        Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPlanStatusFromAPIAsync(bool status); 
        Task<Result<SubscriptionPlan>> ViewSubscriptionPlanByIdFromAPIAsync(int plainId);
        Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPlanStatusFromAPIAsync(bool status, string email);
        Task<Result<bool>> CreateNewSubscriptionPlanFromAPIAsync(SubscriptionPlanRequest request);
        Task<Result<bool>> CheckSubscriptionPlanAfterCreateFromAPIAsync(int subscriptionPlanId, bool status);
        Task<Result<bool>> UpdateSubscriptionPlanFromAPIAsync(SubscriptionPlanRequest request);
        Task<Result<bool>> RemoveSubscriptionPlanFromAPIAsync(int planId);
    }
}
