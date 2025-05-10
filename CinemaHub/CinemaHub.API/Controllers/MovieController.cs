using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Movies;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.Movies;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using FluentResults;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<MovieController> _logger;

        public MovieController(IMediator mediator, ILogger<MovieController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("movies")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllMovies([FromQuery] bool status, [FromQuery] int pageSize, [FromQuery] string movieId)
        {
            try
            {
                _logger.LogInformation("ViewAllMovies API called.");

                var result = await _mediator.Send(new ViewAllMoviesQuery(status, pageSize, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllMovies attempt failed for Status {Status} - {ErrorMessage}", status, error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllMovies completed successfully for Status {Status} at {Time}", status, DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-movie for status {status} at {Time}. Exception: {ExceptionMessage}", status, DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies-pending")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllMoviePending([FromQuery] int pageSize, [FromQuery] string movieId)
        {
            try
            {
                _logger.LogInformation("ViewAllMoviePending API called.");

                var result = await _mediator.Send(new ViewAllMoviesPendingQuery(pageSize, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllMoviePending attempt failed for Status {Status} - {ErrorMessage}", "Pending", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllMoviePending completed successfully for Status {Status} at {Time}", "Pending", DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-movie-pending at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ViewMovieByIdFromAPIAsync([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("ViewMovieById API called.");

                var result = await _mediator.Send(new ViewMovieByIdQuery(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllMoviePending attempt failed for Status {Status} - {ErrorMessage}", "Pending", error.Message);
                    return BadRequest(ApiResponse<Movie>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewMovieById completed successfully for MovieId {MovieId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<Movie>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-movie-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies/{movieId}/genres/{genreName}")]
        public async Task<IActionResult> SearchMovieByGenre([FromRoute] int movieId, [FromRoute] string genreName)
        {
            try
            {
                _logger.LogInformation("SearchMovieByGenre API called.");

                var result = await _mediator.Send(new SearchMovieByGerneQuery(genreName, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllMoviePending attempt failed for Status {Status} - {ErrorMessage}", "Pending", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("SearchMovieByGenre completed successfully for MovieId {MovieId} and GenreName {GenreName} at {Time}", movieId, genreName, DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing search-movie-by-genre for MovieId {MovieId} and GenreName {GenreName} at {Time}. Exception: {ExceptionMessage}", movieId, genreName, DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("language/{language}")]
        public async Task<IActionResult> SearchMovieByLanguage([FromRoute] string language)
        {
            try
            {
                _logger.LogInformation("SearchMovieByLanguage API called.");

                var result = await _mediator.Send(new SearchMovieByLanguageQuery(language));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SearchMovieByLanguage attempt failed for Language {Language} - {ErrorMessage}", language, error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("SearchMovieByLanguage completed successfully for Language {Language} at {Time}", language, DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing search-movie-by-language at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("year")]
        public async Task<IActionResult> ViewAllYearMovie()
        {
            try
            {
                _logger.LogInformation("ViewAllYearMovie API called.");

                var result = await _mediator.Send(new GetAllMovieYearQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllYearMovie attempt failed for all year - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<int>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllYearMovie completed successfully for all year at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<int>>.SuccessResponse(result.Value.OrderDescending().ToList()));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-year-movie for all year at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("language")]
        public async Task<IActionResult> ViewAllLanguageMovie()
        {
            try
            {
                _logger.LogInformation("ViewAllLanguageMovie API called.");

                var result = await _mediator.Send(new GetAllMovieLanguageQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllYearMovie attempt failed for all year - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<string>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllLanguageMovie completed successfully for all language at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<string>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-language-movie for all year at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("genre-language-year")]
        public async Task<IActionResult> SearchMovieByGenreAndLanguage([FromQuery] string genreName, [FromQuery] string language, [FromQuery] int year, [FromQuery] int pageSize, [FromQuery] string movieId)
        {
            try
            {
                _logger.LogInformation("SearchMovieByGenreAndLanguageAndYear API called.");

                var result = await _mediator.Send(new FilterGenreAndLanguageAndYearQuery(genreName, language, year, pageSize, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SearchMovieByGenreAndLanguageAndYear attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }
                
                _logger.LogInformation("SearchMovieByGenreAndLanguageAndYear completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing search-movie-by-genre-language-year at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("title")]
        public async Task<IActionResult> SearchMovieTitle([FromQuery] string title, [FromQuery] int pageSize, [FromQuery] string movieId)
        {
            try
            {
                _logger.LogInformation("SearchMovieTitle API called.");

                var result = await _mediator.Send(new SearchMovieTitleQuery(title, pageSize, movieId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SearchMovieTitle attempt failed title - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Movie>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("SearchMovieTitle completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Movie>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing search-movie-title at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("movies-title")]
        public async Task<IActionResult> ViewAllMovieTitle()
        {
            try
            {
                _logger.LogInformation("ViewAllMovieTitle API called.");

                var result = await _mediator.Send(new ViewAllMovieTitleQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllMovieTitle attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<string>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllMovieTitle completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<string>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-movie-title for all year at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("genre-wish")]
        public async Task<IActionResult> ViewMovieGenreName([FromBody] List<int> movieId)
        {
            try
            {
                _logger.LogInformation("ViewMovieGenreWish API called.");

                var result = await _mediator.Send(new ViewMovieGenreWishCommand() { Movies = movieId});
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewMovieGenreWish attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<string>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewMovieGenreWish completed successfully for all language at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<string>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-movie-genre-wish for all year at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> CreateNewMovie([FromBody] MovieModel createMovie)
        {
            try
            {
                _logger.LogInformation("CreateNewMovie API called.");

                var movieRequest = new Application.DTOs.Request.MovieRequest()
                {
                    Description = createMovie.Description,
                    Director = createMovie.Director,
                    Duration = createMovie.Duration,
                    EmailStaff = createMovie.EmailStaff,
                    Id = createMovie.Id,
                    Language = createMovie.Language,
                    ReleaseDate = createMovie.ReleaseDate,
                    Thumbnail = createMovie.Thumbnail,
                    Title = createMovie.Title,
                    TrailerUrl = createMovie.TrailerUrl,
                    VideoUrl = createMovie.VideoUrl,
                    GerneName = createMovie.GerneName,
                };

                var result = await _mediator.Send(new CreateMovieCommand(movieRequest));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("CreateNewMovie attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CreateNewMovie completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-new-movie at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut("moderation/{movieId}")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> CheckMovieAfterCreate([FromRoute] int movieId, [FromQuery] bool status)
        {
            try
            {
                _logger.LogInformation("CheckMovieAfterCreate API called.");

                var result = await _mediator.Send(new CheckMovieAfterCreateCommand(movieId, status));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("CheckMovieAfterCreate attempt failed for MovieId {MovieId} - {ErrorMessage}", movieId, error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation($"{status}");
                _logger.LogInformation("CheckMovieAfterCreate completed successfully for MovieId {MovieId} at {Time}", movieId, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing check-movie-after-create at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> UpdateMovie([FromBody] MovieModel createMovie)
        {
            try
            {
                _logger.LogInformation("UpdateMovie API called.");

                var movieRequest = new Application.DTOs.Request.MovieRequest()
                {
                    Description = createMovie.Description,
                    Director = createMovie.Director,
                    Duration = createMovie.Duration,
                    EmailStaff = createMovie.EmailStaff,
                    Id = createMovie.Id,
                    Language = createMovie.Language,
                    ReleaseDate = createMovie.ReleaseDate,
                    Thumbnail = createMovie.Thumbnail,
                    Title = createMovie.Title,
                    TrailerUrl = createMovie.TrailerUrl,
                    VideoUrl = createMovie.VideoUrl,
                    GerneName = createMovie.GerneName,
                };

                var result = await _mediator.Send(new UpdateMovieCommand(movieRequest));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("UpdateMovie attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UpdateMovie successful for MovieId {MovieId} at {Time}", createMovie.Id, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-movie at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> RemoveMovie([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("RemoveMovie API called.");

                var result = await _mediator.Send(new RemoveMovieCommand(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("RemoveMovie attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveMovie successful for MovieId {MovieId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-movie at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
