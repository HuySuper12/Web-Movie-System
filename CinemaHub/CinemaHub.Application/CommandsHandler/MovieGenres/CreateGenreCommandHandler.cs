using CinemaHub.Application.Commands.MovieGenres;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.MovieGenres
{
    public class CreateGenreCommandHandler : IRequestHandler<CreateGenreCommand, Result<bool>>
    {
        private readonly IMovieGenreService _movieGenreService;

        public CreateGenreCommandHandler(IMovieGenreService movieGenreService)
        {
            _movieGenreService = movieGenreService;
        }

        public async Task<Result<bool>> Handle(CreateGenreCommand request, CancellationToken cancellationToken)
        {
            return await _movieGenreService.CreateNewGenreFromAPIAsync(request.MovieGenre);
        }
    }
}
