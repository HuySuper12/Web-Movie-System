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
    public class ViewAllSubscriptionPlanStatusEmailQuery : IRequest<Result<List<SubscriptionPlan>>>
    {
        public string Email { get; set; }
        public bool Status { get; set; }

        public ViewAllSubscriptionPlanStatusEmailQuery(string email, bool status)
        {
            Status = status;
            Email = email;
        }
    }
}
