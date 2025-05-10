using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.SubscriptionPlans
{
    public class CheckSubscriptionPlanAfterCreateCommand : IRequest<Result<bool>>
    {
        public int SubscriptionPlanId { get; set; }
        public bool Status { get; set; }

        public CheckSubscriptionPlanAfterCreateCommand(int subscriptionPlanId, bool status)
        {
            SubscriptionPlanId = subscriptionPlanId;
            Status = status;
        }
    }
}
