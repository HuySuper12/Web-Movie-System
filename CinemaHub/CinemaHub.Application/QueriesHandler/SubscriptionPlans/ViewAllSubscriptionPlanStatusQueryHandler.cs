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
    public class ViewAllSubscriptionPlanStatusQueryHandler : IRequestHandler<ViewAllSubscriptionPlanStatusQuery, Result<List<SubscriptionPlan>>>
    {
        private readonly ISubscriptionPlanService _subscriptionPlanService;

        public ViewAllSubscriptionPlanStatusQueryHandler(ISubscriptionPlanService subscriptionPlanService)
        {
            _subscriptionPlanService = subscriptionPlanService;
        }

        public async Task<Result<List<SubscriptionPlan>>> Handle(ViewAllSubscriptionPlanStatusQuery request, CancellationToken cancellationToken)
        {
            return await _subscriptionPlanService.ViewAllSubscriptionPlanStatusFromAPIAsync(request.Status);
        }
    }
}
