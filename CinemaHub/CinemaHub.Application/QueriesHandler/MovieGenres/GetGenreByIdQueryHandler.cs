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
    public class GetGenreByIdQueryHandler : IRequestHandler<GetGenreByIdQuery, Result<MovieGenre>>
    {
        private readonly IMovieGenreService _movieGenreService;

        public GetGenreByIdQueryHandler(IMovieGenreService movieGenreService)
        {
            _movieGenreService = movieGenreService;
        }

        public async Task<Result<MovieGenre>> Handle(GetGenreByIdQuery request, CancellationToken cancellationToken)
        {
            return await _movieGenreService.GetGenreByIdFromAPIAsync(request.Id);
        }
    }
}
