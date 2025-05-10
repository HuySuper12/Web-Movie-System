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
    public class ViewMovieByIdQueryHandler : IRequestHandler<ViewMovieByIdQuery, Result<Movie>>
    {
        private readonly IMovieService _movieService;

        public ViewMovieByIdQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<Movie>> Handle(ViewMovieByIdQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.ViewMovieByIdFromAPIAsync(request.Id);
        }
    }
}
