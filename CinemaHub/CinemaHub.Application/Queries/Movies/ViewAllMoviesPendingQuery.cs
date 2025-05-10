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
    public class ViewAllMoviesPendingQuery : IRequest<Result<List<Movie>>>
    {
        public int PageSize { get; set; }
        public string MovieId { get; set; }
        public ViewAllMoviesPendingQuery(int pageSize, string movieId)
        {
            PageSize = pageSize;
            MovieId = movieId;
        }
    }
}
