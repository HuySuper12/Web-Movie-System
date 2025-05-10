using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Payments;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Payments
{
    public class CheckPaymentFreeTrialQueryHandler : IRequestHandler<CheckPaymentFreeTrialQuery, Result<bool>>
    {
        private readonly IPaymentService _paymentService;

        public CheckPaymentFreeTrialQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<bool>> Handle(CheckPaymentFreeTrialQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.CheckPaymentFreeTrialFromAPIAsync(request.Email);
        }
    }
}
