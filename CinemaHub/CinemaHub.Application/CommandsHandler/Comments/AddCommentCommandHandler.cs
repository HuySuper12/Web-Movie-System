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
    public class AddCommentCommandHandler : IRequestHandler<AddCommentCommand, Result<bool>>
    {
        private readonly ICommentService _commentService;

        public AddCommentCommandHandler(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<Result<bool>> Handle(AddCommentCommand request, CancellationToken cancellationToken)
        {
            return await _commentService.AddCommentFromAPIAsync(request.CommentRatingRequest);
        }
    }
}
