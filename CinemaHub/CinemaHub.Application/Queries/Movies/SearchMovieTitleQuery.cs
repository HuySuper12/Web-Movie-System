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
    public class SearchMovieTitleQuery : IRequest<Result<List<Movie>>>
    {
        public string Title { get; set; } 
        public int PageSize { get; set; } 
        public string MovieId { get; set; }

        public SearchMovieTitleQuery(string title, int pageSize, string movieId)
        {
            Title = title;
            PageSize = pageSize;
            MovieId = movieId;
        }
    }
}
