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
    public class ViewAllSubscriptionPlanStatusQuery : IRequest<Result<List<SubscriptionPlan>>>
    {
        public bool Status { get; set; }

        public ViewAllSubscriptionPlanStatusQuery(bool status) 
        {
            Status = status;
        }
    }
}
