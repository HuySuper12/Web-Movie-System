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
    public class ViewAllMoviesQuery : IRequest<Result<List<Movie>>>
    {
        public bool Status { get; set; } 
        public int PageSize { get; set; }
        public string MovieId { get; set; }

        public ViewAllMoviesQuery(bool status, int pageSize, string movieId)
        {
            Status = status;
            PageSize = pageSize;
            MovieId = movieId;
        }
    }
}
