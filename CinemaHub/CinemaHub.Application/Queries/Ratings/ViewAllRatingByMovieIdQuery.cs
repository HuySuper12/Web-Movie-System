using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Ratings
{
    public class ViewAllRatingByMovieIdQuery : IRequest<Result<List<Rating>>>
    {
        public int MovieId { get; set; }
        public int PageSize { get; set; }
        public string RatingId { get; set; }
        public ViewAllRatingByMovieIdQuery(int movieId, int pageSize, string ratingId)
        {
            MovieId = movieId;
            PageSize = pageSize;
            RatingId = ratingId;
        }
    }
}
