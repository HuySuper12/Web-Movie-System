using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Ratings;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Ratings
{
    public class ViewAllRatingsQueryHandler : IRequestHandler<ViewAllRatingsQuery, Result<List<Rating>>>
    {
        private readonly IRatingService _ratingService;

        public ViewAllRatingsQueryHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }

        public async Task<Result<List<Rating>>> Handle(ViewAllRatingsQuery request, CancellationToken cancellationToken)
        {
            return await _ratingService.ViewAllRatingsFromAPIAsync();
        }
    }
}
