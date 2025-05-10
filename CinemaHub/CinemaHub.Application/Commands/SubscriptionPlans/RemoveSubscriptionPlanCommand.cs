﻿using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.SubscriptionPlans
{
    public class RemoveSubscriptionPlanCommand : IRequest<Result<bool>>
    {
        public int PlanId { get; set; }
        public RemoveSubscriptionPlanCommand(int planId)
        {
            PlanId = planId;
        }
    }
}
