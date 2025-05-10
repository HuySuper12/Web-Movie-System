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
    public class UpdateGenreCommandHandler : IRequestHandler<UpdateGenreCommand, Result<bool>>
    {
        private readonly IMovieGenreService _movieGenreService;

        public UpdateGenreCommandHandler(IMovieGenreService movieGenreService)
        {
            _movieGenreService = movieGenreService;
        }

        public async Task<Result<bool>> Handle(UpdateGenreCommand request, CancellationToken cancellationToken)
        {
            return await _movieGenreService.UpdateGenreFromAPIAsync(request.MovieGenre);
        }
    }
}
