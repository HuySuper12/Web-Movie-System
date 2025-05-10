using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.SubscriptionPlans
{
    public class ViewSubscriptionPlanByIdQuery : IRequest<Result<SubscriptionPlan>>
    {
        public int PlanId { get; set; } 
        public ViewSubscriptionPlanByIdQuery(int planId)
        {
            PlanId = planId;
        }
    }
}
