using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Comments;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Comments
{
    public class ViewCommentByIdQueryHandler : IRequestHandler<ViewCommentByIdQuery, Result<Comment>>
    {
        private readonly ICommentService _commentService;

        public ViewCommentByIdQueryHandler(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<Result<Comment>> Handle(ViewCommentByIdQuery request, CancellationToken cancellationToken)
        {
            return await _commentService.ViewCommentByIdFromAPIAsync(request.CommentId);
        }
    }
}
