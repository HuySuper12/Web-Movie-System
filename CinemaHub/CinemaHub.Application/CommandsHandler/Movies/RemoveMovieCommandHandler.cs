using CinemaHub.Application.Commands.Movies;
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
    public class RemoveMovieCommandHandler : IRequestHandler<RemoveMovieCommand, Result<bool>>
    {
        private readonly IMovieService _movieService;

        public RemoveMovieCommandHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<bool>> Handle(RemoveMovieCommand request, CancellationToken cancellationToken)
        {
            return await _movieService.RemoveMovieFromAPIAsync(request.MovieId);
        }
    }
}
