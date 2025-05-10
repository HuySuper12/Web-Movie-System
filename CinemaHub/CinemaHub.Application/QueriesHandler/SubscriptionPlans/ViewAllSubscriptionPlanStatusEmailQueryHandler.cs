using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.SubscriptionPlans;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.SubscriptionPlans
{
    public class ViewAllSubscriptionPlanStatusEmailQueryHandler : IRequestHandler<ViewAllSubscriptionPlanStatusEmailQuery, Result<List<SubscriptionPlan>>>
    {
        private readonly ISubscriptionPlanService _subscriptionPlanService;

        public ViewAllSubscriptionPlanStatusEmailQueryHandler(ISubscriptionPlanService subscriptionPlanService)
        {
            _subscriptionPlanService = subscriptionPlanService;
        }

        public async Task<Result<List<SubscriptionPlan>>> Handle(ViewAllSubscriptionPlanStatusEmailQuery request, CancellationToken cancellationToken)
        {
            return await _subscriptionPlanService.ViewAllSubscriptionPlanStatusFromAPIAsync(request.Status, request.Email);
        }
    }
}
