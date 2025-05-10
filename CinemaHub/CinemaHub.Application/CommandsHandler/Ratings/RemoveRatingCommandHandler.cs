using CinemaHub.Application.Commands.Ratings;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Ratings
{
    public class RemoveRatingCommandHandler : IRequestHandler<RemoveRatingCommand, Result<bool>>
    {
        private readonly IRatingService _ratingService;

        public RemoveRatingCommandHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }
        public async Task<Result<bool>> Handle(RemoveRatingCommand request, CancellationToken cancellationToken)
        {
            return await _ratingService.RemoveRatingFromAPIAsync(request.RatingId);
        }
    }
}
