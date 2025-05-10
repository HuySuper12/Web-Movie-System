using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.MovieGenres;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.MovieGenres;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using FluentResults;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieGenreController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<MovieGenreController> _logger;

        public MovieGenreController(IMediator mediator, ILogger<MovieGenreController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("genres")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllGenres()
        {
            try
            {
                _logger.LogInformation("ViewAllGenres API called.");

                var result = await _mediator.Send(new ViewAllGenresQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllGenres attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<MovieGenre>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllGenres completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<MovieGenre>>.SuccessResponse(result.Value.OrderByDescending(x => x.GenreId).ToList()));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-genre at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetGenreById([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("GetGenreById API called.");

                var result = await _mediator.Send(new GetGenreByIdQuery(id));

                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetGenreById attempt failed for GenreId {GenreId} - {ErrorMessage}", id, error.Message);
                    return BadRequest(ApiResponse<MovieGenre>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetGenreById completed successfully for GenreId {GenreId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<MovieGenre>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-genre-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("genres/by-genre-name")]
        public async Task<IActionResult> GetGenreByName([FromQuery] string name)
        {
            try
            {
                _logger.LogInformation("GetGenreByName API called.");

                var result = await _mediator.Send(new GetGenreByNameQuery(name));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetGenreByName attempt failed for GenreName {GenreName} - {ErrorMessage}", name, error.Message);
                    return BadRequest(ApiResponse<MovieGenre>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetGenreByName completed successfully for GenreName {GenreName} at {Time}", name, DateTime.UtcNow);
                return Ok(ApiResponse<MovieGenre>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-genre-by-name at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> CreateNewGenre([FromBody] MovieGenre movieGenre)
        {
            try
            {
                _logger.LogInformation("CreateNewGenre API called.");

                var result = await _mediator.Send(new CreateGenreCommand(movieGenre));

                _logger.LogInformation("CreateNewGenre completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-new-genre at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> UpdateGenre([FromBody] MovieGenre movieGenre)
        {
            try
            {
                _logger.LogInformation("UpdateGenre API called.");

                var result = await _mediator.Send(new UpdateGenreCommand(movieGenre));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("UpdateGenre attempt failed for GenreId {GenreId} - {ErrorMessage}", movieGenre.GenreId, error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UpdateGenre completed successfully for GenreId {GenreId} at {Time}", movieGenre.GenreId, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-genre at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> DeleteGenre([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("RemoveGenre API called.");

                var result = await _mediator.Send(new DeleteGenreCommand(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("RemoveGenre attempt failed for GenreId {GenreId} - {ErrorMessage}", id, error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveGenre completed successfully for GenreId {GenreId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(true));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-genre at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
