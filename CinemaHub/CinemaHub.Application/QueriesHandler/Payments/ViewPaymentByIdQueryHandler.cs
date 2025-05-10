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
    public class ViewPaymentByIdQueryHandler : IRequestHandler<ViewPaymentByIdQuery, Result<Payment>>
    {
        private readonly IPaymentService _paymentService;

        public ViewPaymentByIdQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<Payment>> Handle(ViewPaymentByIdQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.ViewPaymentByIdFromAPIAsync(request.Id);
        }
    }
}
