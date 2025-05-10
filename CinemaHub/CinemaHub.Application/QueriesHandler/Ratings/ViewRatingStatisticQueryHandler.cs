using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Ratings;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Ratings
{
    public class ViewRatingStatisticQueryHandler : IRequestHandler<ViewRatingStatisticQuery, Result<List<ViewRatingStatisticResponse>>>
    {
        private readonly IRatingService _ratingService;

        public ViewRatingStatisticQueryHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }

        public async Task<Result<List<ViewRatingStatisticResponse>>> Handle(ViewRatingStatisticQuery request, CancellationToken cancellationToken)
        {
            return await _ratingService.ViewRatingStatisticAsync(request.Status, request.PageSize, request.MovieId);
        }
    }
}
