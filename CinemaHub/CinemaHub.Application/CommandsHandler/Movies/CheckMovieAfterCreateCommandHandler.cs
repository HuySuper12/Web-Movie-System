using CinemaHub.Application.Commands.Movies;
using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Movies
{
    public class CheckMovieAfterCreateCommandHandler : IRequestHandler<CheckMovieAfterCreateCommand, Result<bool>>
    {
        private readonly IMovieService _movieService;
        private readonly IMediator _mediator;

        public CheckMovieAfterCreateCommandHandler(IMovieService movieService, IMediator mediator)
        {
            _movieService = movieService;
            _mediator = mediator;
        }

        public async Task<Result<bool>> Handle(CheckMovieAfterCreateCommand request, CancellationToken cancellationToken)
        {
            var result = await _movieService.CheckMovieFromAPIAsync(request.MovieId, request.Status);
            if (result.Value == true && request.Status == true)
            {
                await _mediator.Publish(new NotificationNewMovieEvent(request.MovieId));
            }
            return result;
        }
    }
}
