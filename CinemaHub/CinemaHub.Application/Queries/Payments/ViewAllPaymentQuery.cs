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
    public class ViewAllPaymentQuery : IRequest<Result<List<Payment>>>
    {
        public int PageSize { get; set; }
        public string PaymentId { get; set; }
        public ViewAllPaymentQuery(int pageSize, string paymentId)
        {
            PageSize = pageSize;
            PaymentId = paymentId;
        }
    }
}
