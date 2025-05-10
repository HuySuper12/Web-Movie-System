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
    public class CalculateRatingAverageQuery : IRequest<Result<double>>
    {
        public int MovieId { get; set; }
        public CalculateRatingAverageQuery(int movieId)
        {
            MovieId = movieId;
        }
    }
}
