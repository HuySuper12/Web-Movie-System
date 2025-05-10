using CinemaHub.Application.Commands.Comments;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Comments
{
    public class RemoveCommentCommandHandler : IRequestHandler<RemoveCommentCommand, Result<bool>>
    {
        private readonly ICommentService _commentService;

        public RemoveCommentCommandHandler(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<Result<bool>> Handle(RemoveCommentCommand request, CancellationToken cancellationToken)
        {
            return await _commentService.RemoveCommentFromAPIAsync(request.CommentId);
        }
    }
}
