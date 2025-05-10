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
    public class ViewLastedPaymentExpiredQueryHandler : IRequestHandler<ViewLastedPaymentExpiredQuery, Result<Payment>>
    {
        private readonly IPaymentService _paymentService;

        public ViewLastedPaymentExpiredQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<Payment>> Handle(ViewLastedPaymentExpiredQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.ViewLastedPaymentExpiredFromAPIAsync(request.Email);
        }
    }
}
