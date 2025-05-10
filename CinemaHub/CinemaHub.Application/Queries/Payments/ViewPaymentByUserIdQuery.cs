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
    public class ViewPaymentByUserIdQuery : IRequest<Result<List<Payment>>>
    {
        public string Email { get; set; }
        public int PageSize { get; set; }
        public string PaymentId { get; set; }
        public ViewPaymentByUserIdQuery(string email, int pageSize, string paymentId)
        {
            Email = email;
            PageSize = pageSize;
            PaymentId = paymentId;
        }
    }
}
