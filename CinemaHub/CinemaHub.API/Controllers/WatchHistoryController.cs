using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.WatchHistories;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.WatchHistories;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WatchHistoryController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<WatchHistoryController> _logger;

        public WatchHistoryController(IMediator mediator, ILogger<WatchHistoryController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("accounts/{email}/movies/{movieId}/check-user")]
        public async Task<IActionResult> CheckUserWatchHistoryAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("CheckUserWatchHistory API called.");

                var result = await _mediator.Send(new CheckUserWatchHistoryQuery(email, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("CheckUserWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<WatchHistory>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CheckUserWatchHistory completed successfully for this month at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<WatchHistory>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing check-user-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/movies/{movieId}/user-last")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> UserLastWatchHistoryFromAPIAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("UserLastWatchHistory API called.");

                var result = await _mediator.Send(new UserLastWatchHistoryQuery(email, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("UserLastWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<WatchHistory>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UserLastWatchHistory completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<WatchHistory>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing user-last-watch-history-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ViewWatchHistoryByIdFromAPIAsync(int id)
        {
            try
            {
                _logger.LogInformation("ViewWatchHistoryById API called.");

                var result = await _mediator.Send(new ViewWatchHistoryByIdQuery(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewWatchHistoryById attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<WatchHistory>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewWatchHistoryById completed successfully for WatchHistoryId {WatchHistoryId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<WatchHistory>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-watch-history-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("watch-history")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllUserWatchHistoryFromAPIAsync()
        {
            try
            {
                _logger.LogInformation("ViewAllUserWatchHistory API called.");

                var result = await _mediator.Send(new ViewAllUserWatchHistoryQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewAllUserWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<WatchHistory>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllUserWatchHistory completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<WatchHistory>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-user-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/watch-history/user")]
        [Authorize(Roles = ApplicationRoles.User)]
        [Cache(1000)]
        public async Task<IActionResult> ViewUserWatchHistoryByEmailFromAPIAsync([FromRoute] string email, [FromQuery]int pageSize, [FromQuery] string id)
        {
            try
            {
                _logger.LogInformation("ViewUserWatchHistoryByEmail API called.");

                var result = await _mediator.Send(new ViewUserWatchHistoryByEmailQuery(email, pageSize, id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewUserWatchHistoryByEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<WatchHistory>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewUserWatchHistoryByEmail completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<WatchHistory>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-user-watch-history-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/watch-history/movies")]
        [Authorize(Roles = ApplicationRoles.User)]
        [Cache(1000)]
        public async Task<IActionResult> ViewMovieDetailsInWatchHistory(string email, int pageSize, string id)
        {
            try
            {
                _logger.LogInformation("ViewMovieDetailsInWatchHistoryByEmail API called.");

                var result = await _mediator.Send(new ViewMovieDetailsInWatchHistoryQuery(email, pageSize, id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewMovieDetailsInWatchHistoryByEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewMovieDetailsInWatchHistoryByEmail completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-movie-details-in-watch-history-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("watch-history/total-view")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> ViewAllWatchHistoryTodayFromAPIAsync([FromQuery] string search)
        {
            try
            {
                _logger.LogInformation("ViewTotalView API called.");

                var result = await _mediator.Send(new ViewAllWatchHistoryTodayQuery(search));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewTotalView attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<int>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogWarning("ViewTotalView attempt failed - Not found any history list");
                return Ok(ApiResponse<int>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-total-view at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("accounts/{email}/movies/{movieId}/add")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> AddWatchHistoryFromAPIAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("AddWatchHistory API called.");

                var result = await _mediator.Send(new AddWatchHistoryCommand(email, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("AddWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddWatchHistory completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("accounts/{email}/movies/{movieId}/continue")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> ContinueWatchHistoryFromAPIAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("ContinueWatchHistory API called.");

                var result = await _mediator.Send(new ContinueWatchHistoryCommand(email, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ContinueWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ContinueWatchHistory completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing continue-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut("accounts/{email}/movies/{movieId}")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> UpdateWatchHistoryFromAPIAsync(string email, int movieId)
        {
            try
            {
                _logger.LogInformation("UpdateWatchHistory API called.");

                var result = await _mediator.Send(new UpdateWatchHistoryCommand(email, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("UpdateWatchHistory attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UpdateWatchHistory completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> RemoveWatchHistoryFromAPIAsync(int id)
        {
            try
            {
                _logger.LogInformation("RemoveWatchHistoryById API called.");

                var result = await _mediator.Send(new RemoveWatchHistoryCommand(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("RemoveWatchHistoryById attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }


                _logger.LogInformation("RemoveWatchHistoryById completed successfully for Email {Email} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-watch-history at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
