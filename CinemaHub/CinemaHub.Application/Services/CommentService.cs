using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class CommentService : ICommentService
    {
        private readonly ICommentRepository _commentRepository;
        private readonly IMovieRepository _movieRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;

        public CommentService(ICommentRepository commentRepository, IMovieRepository movieRepository, IAccountRepository accountRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _commentRepository = commentRepository;
            _movieRepository = movieRepository;
            _accountRepository = accountRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> AddCommentFromAPIAsync(CommentRatingRequest comment)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(comment.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(comment.MovieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var newComment = new Comment
            {
                MovieId = comment.MovieId,
                UserId = account.Id,
                Content = comment.Content,
                CreatedAt = DateTime.Now,
                Status = true
            };

            _commentRepository.AddCommentAsync(newComment);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Comment
            await _responseCache.DeleteKeyInRedis("Comment");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> RemoveCommentFromAPIAsync(int commentId)
        {
            var searchComment = await _commentRepository.ViewCommentByIdAsync(commentId);
            if (searchComment == null)
            {
                return Result.Fail<bool>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }

            searchComment.Status = false;
            _commentRepository.RemoveCommentAsync(searchComment);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Comment
            await _responseCache.DeleteKeyInRedis("Comment");
            return Result.Ok(true);
        }

        public async Task<Result<List<Comment>>> ViewAllCommentByMovieIdFromAPIAsync(int movieId, int pageSize, string commentId)
        {
            var checkMovie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (checkMovie == null)
            {
                return Result.Fail<List<Comment>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = await _commentRepository.ViewAllCommentByMovieIdAsync(new Comment() { MovieId = movieId, Status = true }, pageSize, commentId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Comment>>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Comment>>> ViewAllCommentsFromAPIAsync(int pageSize, string commentId)
        {
            var result = await _commentRepository.ViewAllCommentsAsync(pageSize, commentId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Comment>>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<Comment>> ViewCommentByIdFromAPIAsync(int commentId)
        {
            var result = await _commentRepository.ViewCommentByIdAsync(commentId);
            if(result == null)
            {
                return Result.Fail<Comment>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
