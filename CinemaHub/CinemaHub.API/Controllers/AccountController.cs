using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Account;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.Account;
using CinemaHub.Domain.Entities;
using CinemaHub.Infrastructure.Persistences;
using FluentResults;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<AccountController> _logger;

        public AccountController(IMediator mediator, ILogger<AccountController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ViewProfileById([FromRoute] string id)
        {
            try
            {
                _logger.LogInformation("ViewProfileById API called.");

                var result = await _mediator.Send(new ViewProfileIdQuery(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewProfileById attempt failed for UserId {UserId} - {ErrorMessage}", id, error.Message);
                    return BadRequest(ApiResponse<AccountResponse>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewProfileById completed successfully for UserId {UserId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<AccountResponse>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-profile-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("email/{email}")]
        public async Task<IActionResult> ViewProfileByEmail([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("ViewProfileByEmail API called.");

                var result = await _mediator.Send(new ViewProfileEmailQuery(email));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewProfileByEmail attempt failed for Email {Email} - {ErrorMessage}", email, error.Message);
                    return BadRequest(ApiResponse<AccountResponse>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewProfileByEmail completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<AccountResponse>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-profile-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("role")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        [Cache(1000)]
        public async Task<IActionResult> ViewAccountsByRoles([FromQuery] string role)
        {
            try
            {
                _logger.LogInformation("ViewAccountsByRole API called.");

                var result = await _mediator.Send(new ViewAccountRoleQuery(role));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAccountsByRole attempt failed for Role {Role} - {ErrorMessage}", role, error.Message);
                    return BadRequest(ApiResponse<List<AccountResponse>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAccountsByRole completed successfully for Role {Role} at {Time}", role, DateTime.UtcNow);
                return Ok(ApiResponse<List<AccountResponse>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-profile-by-role at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }

        }

        [HttpGet("roles")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Cache(1000)]
        public async Task<IActionResult> ViewAccountsByRole([FromQuery] string role, [FromQuery] int pageSize, [FromQuery] string userId)
        {
            try
            {
                _logger.LogInformation("ViewAccountsByRole API called.");

                var result = await _mediator.Send(new ViewAccountRolePaginationQuery(role, pageSize, userId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAccountsByRole attempt failed for Role {Role} - {ErrorMessage}", role, error.Message);
                    return BadRequest(ApiResponse<List<AccountResponse>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAccountsByRole completed successfully for Role {Role} at {Time}", role, DateTime.UtcNow);
                return Ok(ApiResponse<List<AccountResponse>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-profile-by-role at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> UpdateAccount([FromBody] UpdateAccountModel account)
        {
            try
            {
                _logger.LogInformation("UpdateAccount API called.");

                var user = new UpdateAccountCommand(account.Email, account.FullName, account.PhoneNumber, account.PictureUrl);
                var result = await _mediator.Send(user);

                if (result.Succeeded)
                {
                    _logger.LogInformation("UpdateAccount completed successfully for Email {Email} at {Time}", account.Email, DateTime.UtcNow);
                    return Ok(ApiResponse<IdentityResult>.SuccessResponse(result));
                }
                else
                {
                    string errors = "";
                    foreach (var error in result.Errors)
                    {
                        _logger.LogWarning(error.Description);
                        errors += error.Description + ", ";
                    }
                    _logger.LogWarning("UpdateAccount attempt failed");
                    return BadRequest(ApiResponse<bool>.ErrorResponse(errors, 400));
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-account at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }

        }

        [HttpDelete("user/{email}")]
        [Authorize(Roles = ApplicationRoles.Staff + "," + ApplicationRoles.Manager)]
        public async Task<IActionResult> DisableAccountCustomer([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("DisableAccount API called");

                var result = await _mediator.Send(new DisableAccountCommand(email));
                if (result.Succeeded)
                {
                    _logger.LogInformation("DisableAccount completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                    return Ok(ApiResponse<IdentityResult>.SuccessResponse(result));
                }
                else
                {
                    string errors = "";
                    foreach (var error in result.Errors)
                    {
                        _logger.LogWarning(error.Description);
                        errors += error.Description + ", ";
                    }
                    _logger.LogWarning("UpdateAccount attempt failed");
                    return BadRequest(ApiResponse<bool>.ErrorResponse(errors, 400));
                }
            }
            catch (Exception ex)
            {
                // Log exception (optional)
                _logger.LogError(ex, "Error occurred while processing disable-account at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("staff/{email}")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> RemoveAccountStaff([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("RemoveAccountStaff API called.");

                var result = await _mediator.Send(new RemoveAccountCommand(email));
                if (result.Succeeded)
                {
                    _logger.LogInformation("RemoveAccountStaff completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                    return Ok(ApiResponse<IdentityResult>.SuccessResponse(result));
                }
                else
                {
                    string errors = "";
                    foreach (var error in result.Errors)
                    {
                        _logger.LogWarning(error.Description);
                        errors += error.Description + ", ";
                    }
                    _logger.LogWarning("UpdateAccount attempt failed");
                    return BadRequest(ApiResponse<bool>.ErrorResponse(errors, 400));
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-account-staff at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
