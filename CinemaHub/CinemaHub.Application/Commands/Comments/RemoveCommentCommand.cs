using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Comments
{
    public class RemoveCommentCommand : IRequest<Result<bool>>
    {
        public int CommentId { get; set; }

        public RemoveCommentCommand(int commentId)
        {
            CommentId = commentId;
        }
    }
}
