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
    public class ViewSubscriptionPlanByIdQueryHandler : IRequestHandler<ViewSubscriptionPlanByIdQuery, Result<SubscriptionPlan>>
    {
        private readonly ISubscriptionPlanService _subscriptionPlanService;

        public ViewSubscriptionPlanByIdQueryHandler(ISubscriptionPlanService subscriptionPlanService)
        {
            _subscriptionPlanService = subscriptionPlanService;
        }

        public async Task<Result<SubscriptionPlan>> Handle(ViewSubscriptionPlanByIdQuery request, CancellationToken cancellationToken)
        {
            return await _subscriptionPlanService.ViewSubscriptionPlanByIdFromAPIAsync(request.PlanId);
        }
    }
}
