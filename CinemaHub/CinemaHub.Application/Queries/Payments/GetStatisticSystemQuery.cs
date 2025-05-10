using CinemaHub.Application.DTOs.Response;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Payments
{
    public class GetStatisticSystemQuery : IRequest<Result<List<StatisticSystemResponse>>>
    {
    }
}
