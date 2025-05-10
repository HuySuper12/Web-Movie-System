using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.Commands.SubscriptionPlans;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.SubscriptionPlans;
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
    public class SubscriptionPlanController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<SubscriptionPlanController> _logger;

        public SubscriptionPlanController(IMediator mediator, ILogger<SubscriptionPlanController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("subscription-plan-pending")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllSubscriptionPlanPendingAsync()
        {
            try
            {
                _logger.LogInformation("ViewAllSubscriptionPlanPending API called.");

                var result = await _mediator.Send(new ViewAllSubscriptionPendingQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewAllSubscriptionPlanPending attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<SubscriptionPlan>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllSubscriptionPlanPending completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<SubscriptionPlan>>.SuccessResponse(result.Value.OrderBy(p => p.Price).ToList()));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-subscription-plan-pending at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("subscription-plans")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllSubscriptionPlanAsync([FromQuery] bool status)
        {
            try
            {
                _logger.LogInformation("ViewAllSubscriptionPlan API called.");

                var result = await _mediator.Send(new ViewAllSubscriptionPlanStatusQuery(status));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewAllSubscriptionPlan attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<SubscriptionPlan>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllSubscriptionPlan completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<SubscriptionPlan>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-subscription-plan at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/subscription-plans")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllSubscriptionPlanStatusAsync([FromRoute] string email, [FromQuery] bool status)
        {
            try
            {
                _logger.LogInformation("ViewAllSubscriptionPlanStatus API called.");

                var result = await _mediator.Send(new ViewAllSubscriptionPlanStatusEmailQuery(email, status));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewAllSubscriptionPlan attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<SubscriptionPlan>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllSubscriptionPlanStatus completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<SubscriptionPlan>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-subscription-plan-status at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ViewSubscriptionPlanByIdAsync([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("ViewSubscriptionPlanById API called.");

                var result = await _mediator.Send(new ViewSubscriptionPlanByIdQuery(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("ViewSubscriptionPlanById attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<SubscriptionPlan>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewSubscriptionPlanById completed successfully for SubscriptionPlanId {SubscriptionPlanId} at {Time}", id, DateTime.UtcNow);
                return Ok(ApiResponse<SubscriptionPlan>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-subscription-plan-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> CreateNewSubscriptionPlanAsync([FromBody] SubscriptionPlanModel createSubscriptionPlan)
        {
            try
            {
                _logger.LogInformation("CreateNewSubscriptionPlan API called.");

                var subscriptionPlan = new Application.DTOs.Request.SubscriptionPlanRequest()
                {
                    PlanName = createSubscriptionPlan.PlanName,
                    Description = createSubscriptionPlan.Description,
                    Price = createSubscriptionPlan.Price,
                    Duration = createSubscriptionPlan.Duration
                };
                var result = await _mediator.Send(new CreateNewSubscriptionPlanCommand(subscriptionPlan));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("CreateNewSubscriptionPlan attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CreateNewSubscriptionPlan completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-new-subscription-plan at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut("moderation/{subscriptionPlanId}")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> CheckSubscriptionPlanAfterCreateAsync([FromRoute] int subscriptionPlanId, [FromQuery] bool status)
        {
            try
            {
                _logger.LogInformation("CheckSubscriptionPlanAfterCreate API called.");

                var result = await _mediator.Send(new CheckSubscriptionPlanAfterCreateCommand(subscriptionPlanId, status));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("CheckSubscriptionPlanAfterCreate attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CheckSubscriptionPlanAfterCreate completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing check-subscription-plan-after-update at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> UpdateSubscriptionPlanAsync([FromBody] SubscriptionPlanModel updateSubscriptionPlan)
        {
            try
            {
                _logger.LogInformation("UpdateSubscriptionPlan API called.");

                var subscriptionPlan = new Application.DTOs.Request.SubscriptionPlanRequest()
                {
                    Id = updateSubscriptionPlan.Id,
                    PlanName = updateSubscriptionPlan.PlanName,
                    Description = updateSubscriptionPlan.Description,
                    Price = updateSubscriptionPlan.Price,
                    Duration = updateSubscriptionPlan.Duration
                };
                var result = await _mediator.Send(new UpdateSubscriptionPlanCommand(subscriptionPlan));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("UpdateSubscriptionPlan attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UpdateSubscriptionPlan completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-subscription-plan at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = ApplicationRoles.Manager + "," + ApplicationRoles.Staff)]
        public async Task<IActionResult> RemoveSubscriptionPlanAsync([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("RemoveSubscriptionPlan API called.");

                var result = await _mediator.Send(new RemoveSubscriptionPlanCommand(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("RemoveSubscriptionPlan attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveSubscriptionPlan completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing removie-subscription-plan at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
