using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.SubscriptionPlans
{
    public class CreateNewSubscriptionPlanCommand : IRequest<Result<bool>>
    {
        public SubscriptionPlanRequest SubscriptionPlanRequest { get; set; }

        public CreateNewSubscriptionPlanCommand(SubscriptionPlanRequest subscriptionPlanRequest)
        {
            SubscriptionPlanRequest = subscriptionPlanRequest;
        }

    }
}
