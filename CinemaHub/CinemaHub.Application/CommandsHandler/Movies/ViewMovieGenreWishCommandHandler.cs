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
    public class ViewMovieGenreWishCommandHandler : IRequestHandler<ViewMovieGenreWishCommand, Result<List<string>>>
    {
        private readonly IMovieService _movieService;

        public ViewMovieGenreWishCommandHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<string>>> Handle(ViewMovieGenreWishCommand request, CancellationToken cancellationToken)
        {
            return await _movieService.ViewMovieGenreWish(request.Movies);
        }
    }
}
