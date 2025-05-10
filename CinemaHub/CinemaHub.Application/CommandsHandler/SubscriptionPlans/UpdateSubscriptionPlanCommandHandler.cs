using CinemaHub.Application.Commands.SubscriptionPlans;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.SubscriptionPlans
{
    public class UpdateSubscriptionPlanCommandHandler : IRequestHandler<UpdateSubscriptionPlanCommand, Result<bool>>
    {
        private readonly ISubscriptionPlanService _subscriptionPlanService;

        public UpdateSubscriptionPlanCommandHandler(ISubscriptionPlanService subscriptionPlanService)
        {
            _subscriptionPlanService = subscriptionPlanService;
        }

        public Task<Result<bool>> Handle(UpdateSubscriptionPlanCommand request, CancellationToken cancellationToken)
        {
            return _subscriptionPlanService.UpdateSubscriptionPlanFromAPIAsync(request.SubscriptionPlanRequest);
        }
    }
}
