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
    public class SearchMovieTitleQueryHandler : IRequestHandler<SearchMovieTitleQuery, Result<List<Movie>>>
    {
        private readonly IMovieService _movieService;

        public SearchMovieTitleQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<Movie>>> Handle(SearchMovieTitleQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.SearchMovieTitleAsync(request.Title, request.PageSize, request.MovieId);
        }
    }
}
