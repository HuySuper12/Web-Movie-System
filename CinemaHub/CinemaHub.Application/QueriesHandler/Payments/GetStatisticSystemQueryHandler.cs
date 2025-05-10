using CinemaHub.Application.DTOs.Response;
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
    public class GetStatisticSystemQueryHandler : IRequestHandler<GetStatisticSystemQuery, Result<List<StatisticSystemResponse>>>
    {
        private readonly IPaymentService _paymentService;

        public GetStatisticSystemQueryHandler(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        public async Task<Result<List<StatisticSystemResponse>>> Handle(GetStatisticSystemQuery request, CancellationToken cancellationToken)
        {
            return await _paymentService.GetStatisticSystemFromAPIAsync();
        }
    }
}
