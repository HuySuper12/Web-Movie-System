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
    public class CreateMovieCommandHandler : IRequestHandler<CreateMovieCommand, Result<bool>>
    {
        private readonly IMovieService _movieService;

        public CreateMovieCommandHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<bool>> Handle(CreateMovieCommand request, CancellationToken cancellationToken)
        {
            return await _movieService.CreateNewMovieFromAPIAsync(request.MovieRequest);
        }
    }
}
