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
    public class CreateNewSubscriptionPlanCommandHandler : IRequestHandler<CreateNewSubscriptionPlanCommand, Result<bool>>
    {
        private readonly ISubscriptionPlanService _subscriptionPlanService;

        public CreateNewSubscriptionPlanCommandHandler(ISubscriptionPlanService subscriptionPlanService)
        {
            _subscriptionPlanService = subscriptionPlanService;
        }

        public async Task<Result<bool>> Handle(CreateNewSubscriptionPlanCommand request, CancellationToken cancellationToken)
        {
            return await _subscriptionPlanService.CreateNewSubscriptionPlanFromAPIAsync(request.SubscriptionPlanRequest);
        }
    }
}
