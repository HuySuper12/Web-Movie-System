using CinemaHub.Application.QueriesHandler.Payments;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Payments
{
    public class ViewLastedPaymentExpiredQuery : IRequest<Result<Payment>>
    {
        public string Email { get; set; }
        public ViewLastedPaymentExpiredQuery(string email)
        {
            Email = email;
        }
    }
}
