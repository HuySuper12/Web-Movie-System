using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Comments
{
    public class ViewAllCommentByMovieIdQuery : IRequest<Result<List<Comment>>>
    {
        public int MovieId { get; set; }    
        public int PageSize { get; set; }
        public string CommentId { get; set; }

        public ViewAllCommentByMovieIdQuery(int movieId, int pageSize, string commentId)
        {
            MovieId = movieId;
            PageSize = pageSize;
            CommentId = commentId;
        }
    }
}
