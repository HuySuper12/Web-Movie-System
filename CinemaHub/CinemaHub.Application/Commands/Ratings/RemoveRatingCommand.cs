using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Ratings
{
    public class RemoveRatingCommand : IRequest<Result<bool>>
    {
        public int RatingId { get; set; }
        public RemoveRatingCommand(int ratingId)
        {
            RatingId = ratingId;
        }
    }
}
