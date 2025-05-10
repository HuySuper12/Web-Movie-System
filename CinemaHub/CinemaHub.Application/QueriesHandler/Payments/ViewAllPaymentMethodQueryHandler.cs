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
    public class ViewAllPaymentMethodQueryHandler : IRequestHandler<ViewAllPaymentMethodQuery, Result<List<Payment>>>
    {
        private readonly IPaymentService _paymentService;

        public ViewAllPaymentMethodQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<List<Payment>>> Handle(ViewAllPaymentMethodQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.ViewAllPaymentMethodFromAPIAsync(request.PaymentMethod);
        }
    }
}
