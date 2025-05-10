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
    public class GetAllMovieYearQueryHandler : IRequestHandler<GetAllMovieYearQuery, Result<List<int>>>
    {
        private readonly IMovieService _movieService;

        public GetAllMovieYearQueryHandler(IMovieService movieService)
        {
            _movieService = movieService;
        }

        public async Task<Result<List<int>>> Handle(GetAllMovieYearQuery request, CancellationToken cancellationToken)
        {
            return await _movieService.GetAllMovieYearFromAPIAsync();
        }
    }
}
