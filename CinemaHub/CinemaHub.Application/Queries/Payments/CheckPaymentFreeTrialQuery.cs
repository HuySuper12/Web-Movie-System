using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Payments
{
    public class CheckPaymentFreeTrialQuery : IRequest<Result<bool>>
    {
        public string Email { get; set; }

        public CheckPaymentFreeTrialQuery(string email) 
        {
            Email = email;
        }
    }
}
