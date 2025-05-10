using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Ratings
{
    public class AddRatingCommand : IRequest<Result<bool>>
    {
        public CommentRatingRequest CommentRating { get; set; }
        public AddRatingCommand(CommentRatingRequest commentRating)
        {
            CommentRating = commentRating;
        }
    }
}
