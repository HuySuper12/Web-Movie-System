using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Movies;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Movies
{
    public class SearchMovieByGerneQueryHandler : IRequestHandler<SearchMovieByGerneQuery, Result<List<Movie>>>
    {
        private readonly IMovieService _movieService;

        public SearchMovieByGerneQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<Movie>>> Handle(SearchMovieByGerneQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.SearchMovieByGerneFromAPIAsync(request.GenreName, request.MovieId);
        }
    }
}
