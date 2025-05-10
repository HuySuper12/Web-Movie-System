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
    public class ViewAllCommentByMovieIdQueryHandler : IRequestHandler<ViewAllCommentByMovieIdQuery, Result<List<Comment>>>
    {
        private readonly ICommentService _commentService;

        public ViewAllCommentByMovieIdQueryHandler(ICommentService commentService)
        {
            _commentService = commentService;
        }

        public async Task<Result<List<Comment>>> Handle(ViewAllCommentByMovieIdQuery request, CancellationToken cancellationToken)
        {
            return await _commentService.ViewAllCommentByMovieIdFromAPIAsync(request.MovieId, request.PageSize, request.CommentId);
        }
    }
}
