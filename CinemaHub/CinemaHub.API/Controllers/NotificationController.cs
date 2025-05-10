using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands.Notifications;
using CinemaHub.Application.Queries.Movies;
using CinemaHub.Application.Queries.Notifications;
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
    public class NotificationController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<NotificationController> _logger;

        public NotificationController(IMediator mediator, ILogger<NotificationController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("accounts/{email}/notifications/staff-sending")]
        [Cache(1000)]
        public async Task<IActionResult> ViewStaffSendNotificationAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string notificationId)
        {
            try
            {
                _logger.LogInformation("ViewStaffSendingNotification API called.");

                var result = await _mediator.Send(new ViewStaffNotificationQuery(email, pageSize, notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewStaffSendingNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Notification>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewStaffSendingNotification completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<Notification>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-staff-sending-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }

        }

        [HttpGet("accounts/{email}/notifications/user")]
        [Cache(1000)]
        public async Task<IActionResult> ViewUserNotificationAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string notificationId)
        {
            try
            {
                _logger.LogInformation("ViewUserNotification API called.");

                var result = await _mediator.Send(new ViewUserNotificationQuery(email, pageSize, notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewUserNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Notification>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewUserNotification completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<Notification>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-user-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/notifications/unread")]
        [Cache(1000)]
        public async Task<IActionResult> ViewUserNotificationUnReadAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string notificationId)
        {
            try
            {
                _logger.LogInformation("ViewUserNotificationUnRead API called.");

                var result = await _mediator.Send(new ViewUserNotificationUnReadQuery(email, pageSize, notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewUserNotificationUnRead attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Notification>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewUserNotificationUnRead completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<Notification>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-user-notification-unread at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("notifications")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllUserNotificationFromAPIAsync([FromQuery] int pageSize, [FromQuery] string notificationId)
        {
            try
            {
                _logger.LogInformation("ViewAllUserNotification API called.");

                var result = await _mediator.Send(new ViewAllUserNotificationQuery(pageSize, notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllUserNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Notification>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllUserNotification completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Notification>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-user-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/notifications/unread/count")]
        public async Task<IActionResult> CountUserNotificationUnReadAsync([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("CountNotificationUnRead API called.");

                var result = await _mediator.Send(new CountUserNotificationUnReadQuery(email));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("CountNotificationUnRead attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<int>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CountNotificationUnRead completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<int>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing count-notification-unread at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{notificationId}")]
        public async Task<IActionResult> ViewNotificationByIdAsync([FromRoute] int notificationId)
        {
            try
            {
                _logger.LogInformation("ViewNotificationById API called.");

                var result = await _mediator.Send(new ViewNotificationByIdQuery(notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllUserNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<Notification>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllUserNotification completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<Notification>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-notification-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Staff + "," + ApplicationRoles.Manager)]
        public async Task<IActionResult> AddNotificationFromAPIAsync([FromBody] NotificationModel createNotification)
        {
            try
            {
                _logger.LogInformation("AddNotification API called.");

                var notification = new Application.DTOs.Request.NotificationRequest()
                {
                    Title = createNotification.Title,
                    Content = createNotification.Content,
                    ReceiverEmail = createNotification.ReceiverEmail,
                    StaffEmail = createNotification.StaffEmail,
                };
                var result = await _mediator.Send(new AddNotificationCommand(notification));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("AddNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddNotification completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("accounts/staff/{staffEmail}/user/{userId}/comments/{commentId}/violation/first")]
        [Authorize(Roles = ApplicationRoles.Staff + "," + ApplicationRoles.Manager)]
        public async Task<IActionResult> AddNotificationViolationAsync([FromRoute] string staffEmail, [FromRoute] string userId, [FromRoute] int commentId)
        {
            try
            {
                _logger.LogInformation("AddNotificationViolationFirst API called.");

                var violation = new Application.DTOs.Request.NotificationViolationRequest()
                {
                    StaffEmail = staffEmail,
                    UserId = userId,
                    CommentId = commentId,
                };
                var result = await _mediator.Send(new AddNotificationViolationFirstCommand(violation));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("AddNotificationViolationFirst attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("AddNotificationViolationFirst completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-notification-violation-first at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("accounts/staff/{staffEmail}/user/{userId}/comments/{commentId}/violation/second")]
        [Authorize(Roles = ApplicationRoles.Staff + "," + ApplicationRoles.Manager)]
        public async Task<IActionResult> AddNotificationViolationSecondAsync([FromRoute] string staffEmail, [FromRoute] string userId, [FromRoute] int commentId)
        {
            try
            {
                _logger.LogInformation("AddNotificationViolationSecond API called.");

                var violation = new Application.DTOs.Request.NotificationViolationRequest()
                {
                    StaffEmail = staffEmail,
                    UserId = userId,
                    CommentId = commentId,
                };
                var result = await _mediator.Send(new AddNotificationViolationSecondCommand(violation));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("AddNotificationViolationSecond attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogWarning("AddNotificationViolationSecond attempt failed");
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing add-notification-violation-second at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPut("{notificationId}")]
        public async Task<IActionResult> UpdateNotificationFromAPIAsync([FromRoute] int notificationId)
        {
            try
            {
                _logger.LogInformation("UpdateNotification API called.");

                var result = await _mediator.Send(new UpdateNotificationCommand(notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("UpdateNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("UpdateNotification completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing update-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpDelete("{notificationId}")]
        public async Task<IActionResult> RemoveNotificationFromAPIAsync([FromRoute] int notificationId)
        {
            try
            {
                _logger.LogInformation("RemoveNotification API called.");

                var result = await _mediator.Send(new RemoveNotificationCommand(notificationId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("RemoveNotification attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("RemoveNotification completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing remove-notification at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
