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
    public class GetAllMovieLanguageQueryHandler : IRequestHandler<GetAllMovieLanguageQuery, Result<List<string>>>
    {
        private readonly IMovieService _movieService;

        public GetAllMovieLanguageQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<string>>> Handle(GetAllMovieLanguageQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.GetAllMovieLanguageFromAPIAsync();
        }
    }
}
