using CinemaHub.Application.DTOs.Request;
using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface ICommentService
    {
        Task<Result<bool>> AddCommentFromAPIAsync(CommentRatingRequest comment);

        Task<Result<bool>> RemoveCommentFromAPIAsync(int commentId);

        Task<Result<List<Comment>>> ViewAllCommentsFromAPIAsync(int pageSize, string commentId);
        Task<Result<List<Comment>>> ViewAllCommentByMovieIdFromAPIAsync(int movieId, int pageSize, string commentId);

        Task<Result<Comment>> ViewCommentByIdFromAPIAsync(int commentId);
    }
}
