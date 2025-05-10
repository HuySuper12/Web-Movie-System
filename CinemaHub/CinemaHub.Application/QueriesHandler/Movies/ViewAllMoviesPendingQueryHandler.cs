using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Movies;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Movies
{
    public class ViewAllMoviesPendingQueryHandler : IRequestHandler<ViewAllMoviesPendingQuery, Result<List<Movie>>>
    {
        private readonly IMovieService _movieService;

        public ViewAllMoviesPendingQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<Movie>>> Handle(ViewAllMoviesPendingQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.ViewAllMoviePendingFromAPIAsync(request.PageSize, request.MovieId);
        }
    }
}
