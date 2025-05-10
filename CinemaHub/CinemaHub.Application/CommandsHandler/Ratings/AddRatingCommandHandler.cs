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
    public class AddRatingCommandHandler : IRequestHandler<AddRatingCommand, Result<bool>>
    {
        private readonly IRatingService _ratingService;

        public AddRatingCommandHandler(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }
        public async Task<Result<bool>> Handle(AddRatingCommand request, CancellationToken cancellationToken)
        {
            return await _ratingService.AddRatingFromAPIAsync(request.CommentRating);
        }
    }
}
