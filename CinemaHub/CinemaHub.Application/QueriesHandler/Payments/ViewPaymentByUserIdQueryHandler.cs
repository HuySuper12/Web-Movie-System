using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Payments;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Payments
{
    public class ViewPaymentByUserIdQueryHandler : IRequestHandler<ViewPaymentByUserIdQuery, Result<List<Payment>>>
    {
        private readonly IPaymentService _paymentService;

        public ViewPaymentByUserIdQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<List<Payment>>> Handle(ViewPaymentByUserIdQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.ViewPaymentByUserIdFromAPIAsync(request.Email, request.PageSize, request.PaymentId);
        }
    }
}
