using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Movies
{
    public class SearchMovieByGerneQuery : IRequest<Result<List<Movie>>>
    {
        public string GenreName { get; set; }
        public int MovieId { get; set; }

        public SearchMovieByGerneQuery(string gerneName, int movieId)
        {
            GenreName = gerneName;
            MovieId = movieId;
        }
    }
}
