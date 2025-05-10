using CinemaHub.Application.Commands.Account;
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
    public class UpdateMovieCommandHandler : IRequestHandler<UpdateMovieCommand, Result<bool>>
    {
        private readonly IMovieService _movieService;

        public UpdateMovieCommandHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<bool>> Handle(UpdateMovieCommand request, CancellationToken cancellationToken)
        {
            return await _movieService.UpdateMovieFromAPIAsync(request.MovieRequest);
        }
    }
}
