using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.UserFavorites;
using CinemaHub.Application.Queries.UserFavorites;
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
    public class UserFavoriteController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<UserFavoriteController> _logger;

        public UserFavoriteController(IMediator mediator, ILogger<UserFavoriteController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("user-favorites")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllUserFavoritesAsync()
        {
            try
            {
                _logger.LogInformation("ViewAllUserFavorites API called.");

                var result = await _mediator.Send(new ViewAllUserFavoritesQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllUserFavorites attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<UserFavorite>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllUserFavorites completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<UserFavorite>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-user-favorites at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/user-favorites")]
        [Authorize(Roles = ApplicationRoles.User)]
        [Cache(1000)]
        public async Task<IActionResult> ViewUserFavoritesByUserIdAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string favoriteId)
        {
            try
            {
                _logger.LogInformation("ViewUserFavoritesByEmail API called.");


                var result = await _mediator.Send(new ViewUserFavoritesByEmailQuery(email, pageSize, favoriteId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewUserFavoritesByEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<UserFavorite>>.ErrorResponse(error.Message, statusCode));
                }
                _logger.LogInformation("ViewUserFavoritesByEmail completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<UserFavorite>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-user-favorite-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/movie-wishlist")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> GetMovieWishListAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string favoriteId)
        {
            try
            {
                _logger.LogInformation("GetMovieWishList API called.");

                var result = await _mediator.Send(new GetMovieWishListQuery(email, pageSize, favoriteId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetMovieWishList attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<int>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetMovieWishList completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<int>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-movie-wish-list at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/movie-wishlist-user")]
        [Authorize(Roles = ApplicationRoles.User)]
        [Cache(1000)]
        public async Task<IActionResult> GetMovieByUserFavoritesEmailAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string favoriteId)
        {
            try
            {
                _logger.LogInformation("GetMovieByUserFavoritesEmail API called.");

                var result = await _mediator.Send(new GetMovieByUserFavoritesQuery(email, pageSize, favoriteId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetMovieByUserFavoritesEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetMovieByUserFavoritesEmail completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-movie-by-user-favorite-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/movies/{movieId}/check-wishlist")]
        public async Task<IActionResult> CheckUserFavoriteAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("CheckUserFavorite API called.");

                var result = await _mediator.Send(new CheckUserFavoriteQuery(new Application.DTOs.Request.WishListRequest() { Email = email, MovieId = movieId }));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("CheckUserFavorite attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CheckUserFavorite completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing check-user-favorite at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("accounts/{email}/movies/{movieId}")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> AddFavoriteAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("AddWishList API called.");

                var result = await _mediator.Send(new AddFavoriteCommand(new Application.DTOs.Request.WishListRequest() { Email = email, MovieId = movieId }));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("AddWishList attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddWishList completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-wish-list at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("accounts/{email}/movies/{movieId}")]
        [Authorize(Roles = ApplicationRoles.User)]
        public async Task<IActionResult> RemoveFavoriteAsync([FromRoute] string email, [FromRoute] int movieId)
        {
            try
            {
                _logger.LogInformation("RemoveWishList API called.");

                var result = await _mediator.Send(new RemoveFavoriteCommand(new Application.DTOs.Request.WishListRequest() { Email = email, MovieId = movieId }));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetMovieByUserFavoritesEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveWishList completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-wish-list at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
