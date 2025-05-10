using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Comments
{
    public class AddCommentCommand : IRequest<Result<bool>>
    {
        public CommentRatingRequest CommentRatingRequest { get; set; }

        public AddCommentCommand(CommentRatingRequest commentRatingRequest)
        {
            CommentRatingRequest = commentRatingRequest;
        }
    }
}
