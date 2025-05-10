using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Movies;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Movies
{
    public class ViewAllMovieTitleQueryHandler : IRequestHandler<ViewAllMovieTitleQuery, Result<List<string>>>
    {
        private readonly IMovieService _movieService;

        public ViewAllMovieTitleQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<string>>> Handle(ViewAllMovieTitleQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.ViewAllMovieTitleFromAPIAsync();
        }
    }
}
