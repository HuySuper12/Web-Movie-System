using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Ratings;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Ratings
{
    public class ViewAllRatingByMovieIdQueryHandler : IRequestHandler<ViewAllRatingByMovieIdQuery, Result<List<Rating>>>
    {
        private readonly IRatingService _ratingService;

        public ViewAllRatingByMovieIdQueryHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }

        public async Task<Result<List<Rating>>> Handle(ViewAllRatingByMovieIdQuery request, CancellationToken cancellationToken)
        {
            return await _ratingService.ViewAllRatingByMovieIdFromAPIAsync(request.MovieId, request.PageSize, request.RatingId);
        }
    }
}
