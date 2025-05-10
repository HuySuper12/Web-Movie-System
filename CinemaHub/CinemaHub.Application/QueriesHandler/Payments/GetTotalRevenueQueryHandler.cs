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
    public class GetTotalRevenueQueryHandler : IRequestHandler<GetTotalRevenueQuery, Result<int>>
    {
        private readonly IPaymentService _paymentService;

        public GetTotalRevenueQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<int>> Handle(GetTotalRevenueQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.GetTotalRevenueFromAPIAsync();
        }
    }
}
