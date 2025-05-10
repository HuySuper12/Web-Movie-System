using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.MovieGenres;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.MovieGenres
{
    public class ViewAllGenresQueryHandler : IRequestHandler<ViewAllGenresQuery, Result<List<MovieGenre>>>
    {
        private readonly IMovieGenreService _movieGenreService;

        public ViewAllGenresQueryHandler(IMovieGenreService movieGenreService)
        {
            _movieGenreService = movieGenreService;
        }

        public async Task<Result<List<MovieGenre>>> Handle(ViewAllGenresQuery request, CancellationToken cancellationToken)
        {
            return await _movieGenreService.ViewAllGenresFromAPIAsync();
        }
    }
}
