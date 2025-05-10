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
    public class ViewAllPaymentMethodQuery : IRequest<Result<List<Payment>>>
    {
        public string PaymentMethod { get; set; }
        public ViewAllPaymentMethodQuery(string paymentMethod)
        {
            PaymentMethod = paymentMethod;
        }
    }
}
