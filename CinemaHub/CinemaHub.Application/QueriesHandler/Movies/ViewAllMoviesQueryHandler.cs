using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Account;
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
    public class ViewAllMoviesQueryHandler : IRequestHandler<ViewAllMoviesQuery, Result<List<Movie>>>
    {
        private readonly IMovieService _movieService;

        public ViewAllMoviesQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<Movie>>> Handle(ViewAllMoviesQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.ViewAllMoviesFromAPIAsync(request.Status, request.PageSize, request.MovieId);
        }
    }
}
