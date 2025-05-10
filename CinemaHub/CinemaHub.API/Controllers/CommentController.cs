using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Comments;
using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.Queries.Comments;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.Design;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<CommentController> _logger;

        public CommentController(IMediator mediator, ILogger<CommentController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("comments")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllCommentsAsync([FromQuery] int pageSize, [FromQuery] string commentId)
        {
            try
            {
                _logger.LogInformation("ViewAllComments API called.");

                var result = await _mediator.Send(new ViewAllCommentsQuery(pageSize, commentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllComments attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Comment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllComments completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Comment>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-comments at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies/{movieId}/comments")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllCommentByMovieIdAsync([FromRoute] int movieId, [FromQuery] int pageSize, [FromQuery] string commentId)
        {
            try
            {
                _logger.LogInformation("ViewAllCommentByMovieId API called.");

                var result = await _mediator.Send(new ViewAllCommentByMovieIdQuery(movieId, pageSize, commentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllCommentByMovieId attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Comment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllCommentByMovieId completed successfully for MovieId {MovieId} at {Time}", movieId, DateTime.UtcNow);
                return Ok(ApiResponse<List<Comment>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-comments-by-movie-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{commentId}")]
        public async Task<IActionResult> ViewCommentByIdAsync([FromRoute] int commentId)
        {
            try
            {
                _logger.LogInformation("ViewCommentById API called.");

                var result = await _mediator.Send(new ViewCommentByIdQuery(commentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewCommentById attempt failed CommentId {CommentId} - {ErrorMessage}", commentId, error.Message);
                    return BadRequest(ApiResponse<Comment>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewCommentById completed successfully for CommentId {CommentId} at {Time}", commentId, DateTime.UtcNow);
                return Ok(ApiResponse<Comment>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-comments-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> AddNewCommentAsync([FromBody] CommentRatingModel commentRating)
        {
            try
            {
                _logger.LogInformation("AddNewComment API called.");

                var comment = new CommentRatingRequest()
                {
                    Content = commentRating.Content,
                    Email = commentRating.Email,
                    MovieId = commentRating.MovieId,
                    Rating1 = commentRating.Rating1,
                };
                var result = await _mediator.Send(new AddCommentCommand(comment));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
                    ? code
            : 400;
                    _logger.LogWarning("AddNewComment attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddNewComment completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-new-comment at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{commentId}")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> RemoveCommentAsync([FromRoute] int commentId)
        {
            try
            {
                _logger.LogInformation("RemoveComment API called.");

                var result = await _mediator.Send(new RemoveCommentCommand(commentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
                    ? code
            : 400;
                    _logger.LogWarning("RemoveComment attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveComment completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-comment at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
