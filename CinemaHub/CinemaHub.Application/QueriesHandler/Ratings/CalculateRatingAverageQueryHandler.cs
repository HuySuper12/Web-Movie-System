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
    public class CalculateRatingAverageQueryHandler : IRequestHandler<CalculateRatingAverageQuery, Result<double>>
    {
        private readonly IRatingService _ratingService;

        public CalculateRatingAverageQueryHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }

        public async Task<Result<double>> Handle(CalculateRatingAverageQuery request, CancellationToken cancellationToken)
        {
            return await _ratingService.CalculateRatingAverageFromAPIAsync(request.MovieId);
        }
    }
}
