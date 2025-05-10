using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Ratings;
using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.Ratings;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using FluentResults;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RatingController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<RatingController> _logger;

        public RatingController(IMediator mediator, ILogger<RatingController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("ratings")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllRatingsAsync()
        {
            try
            {
                _logger.LogInformation("ViewAllRatings API called.");

                var result = await _mediator.Send(new ViewAllRatingsQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllComments attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Rating>>.ErrorResponse(error.Message, statusCode));
                }
            
                _logger.LogInformation("ViewAllRatings completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Rating>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-ratings at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies/{movieId}/ratings")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllRatingByMovieIdAsync([FromRoute] int movieId, [FromQuery] int pageSize, [FromQuery] string ratingId)
        {
            try
            {
                _logger.LogInformation("ViewAllRatingByMovieId API called.");

                var result = await _mediator.Send(new ViewAllRatingByMovieIdQuery(movieId, pageSize, ratingId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllRatingByMovieId attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Rating>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllRatingByMovieId completed successfully for MovieId {MovieId} at {Time}", movieId, DateTime.UtcNow);
                return Ok(ApiResponse<List<Rating>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-rating-by-movie-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies/{movieId}/ratings/average")]
        public async Task<IActionResult> GetMovieAverage([FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("GetMovieAverage API called.");
                var result = await _mediator.Send(new CalculateRatingAverageQuery(movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetMovieAverage attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Rating>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetMovieAverage completed successfully for MovieId {MovieId} at {Time}", movieId, DateTime.UtcNow); 
                return Ok(ApiResponse<double>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-movie-average at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{ratingId}")]
        public async Task<IActionResult> ViewRatingByIdAsync([FromRoute] int ratingId)
        {
            try
            {
                _logger.LogInformation("ViewRatingById API called.");

                var result = await _mediator.Send(new ViewRatingByIdQuery(ratingId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewRatingById attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<Rating>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewRatingById completed successfully for RatingId {RatingId} at {Time}", ratingId, DateTime.UtcNow);
                return Ok(ApiResponse<Rating>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-rating-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("ratings/statistic")]
        [Cache(1000)]
        public async Task<IActionResult> ViewRatingStatisticAsync([FromQuery] bool status, [FromQuery] int pageSize, [FromQuery] string movieId)
        {
            try
            {
                _logger.LogInformation("ViewRatingStatistic API called.");

                var result = await _mediator.Send(new ViewRatingStatisticQuery(status, pageSize, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewRatingStatistic attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<Rating>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewRatingStatistic completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<ViewRatingStatisticResponse>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-rating-statistic at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> AddNewRatingAsync([FromBody] CommentRatingModel comment)
        {
            try
            {
                _logger.LogInformation("AddNewRating API called.");

                var rating = new CommentRatingRequest()
                {
                    Content = comment.Content,
                    Email = comment.Email,
                    MovieId = comment.MovieId,
                    Rating1 = comment.Rating1,
                };
                var result = await _mediator.Send(new AddRatingCommand(rating));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("AddNewRating attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddNewRating completed successfully for MovieId {MovieId} at {Time}", comment.MovieId, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-new-rating at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{ratingId}")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> RemoveRatingAsync([FromRoute] int ratingId)
        {
            try
            {
                _logger.LogInformation("RemoveRating API called.");

                var result = await _mediator.Send(new RemoveRatingCommand(ratingId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("RemoveRating attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }
                
                _logger.LogInformation("RemoveRating completed successfully for RatingId {RatingId} at {Time}", ratingId, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-rating at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
