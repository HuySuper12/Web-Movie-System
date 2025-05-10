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
    public class ViewPaymentByIdQuery : IRequest<Result<Payment>>
    {
        public int Id { get; set; }
        public ViewPaymentByIdQuery(int id)
        {
            Id = id;
        }
    }
}
