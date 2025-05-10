using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Queries.Payments;
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
    public class PaymentController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<PaymentController> _logger;

        public PaymentController(IMediator mediator, ILogger<PaymentController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("payments/total-revenue")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> GetTotalRevenue()
        {
            try
            {
                _logger.LogInformation("GetTotalRevenue API called.");

                var result = await _mediator.Send(new GetTotalRevenueQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetTotalRevenue attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Payment>>.ErrorResponse(error.Message, statusCode));
                }
                _logger.LogInformation("GetTotalRevenue completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<int>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-total-revenue at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("payments/statistic-system")]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> GetStatisticSystem()
        {
            try
            {
                _logger.LogInformation("GetStatistics API called.");

                var result = await _mediator.Send(new GetStatisticSystemQuery());
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("GetTotalRevenue attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<StatisticSystemResponse>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("GetStatistics completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<StatisticSystemResponse>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing get-statistic at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("payments")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllPaymentAsync([FromQuery] int pageSize, [FromQuery] string paymentId)
        {
            try
            {
                _logger.LogInformation("ViewAllPayment API called.");

                var result = await _mediator.Send(new ViewAllPaymentQuery(pageSize, paymentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllPayment attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Payment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllPayment completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Payment>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-payment at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("payments/by-method")]
        [Cache(1000)]
        public async Task<IActionResult> ViewAllPaymentMethodAsync([FromQuery] string paymentMethod)
        {
            try
            {
                _logger.LogInformation("ViewAllPaymentMethod API called.");

                var result = await _mediator.Send(new ViewAllPaymentMethodQuery(paymentMethod));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewAllPaymentMethod attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Payment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewAllPaymentMethod completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<List<Payment>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-all-payment-method at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> ViewPaymentByIdAsync([FromRoute] int id)
        {
            try
            {
                _logger.LogInformation("ViewPaymentById API called.");

                var result = await _mediator.Send(new ViewPaymentByIdQuery(id));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewPaymentById attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Payment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewPaymentById completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<Payment>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-payment-by-id at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/payments")]
        [Cache(1000)]
        public async Task<IActionResult> ViewPaymentByEmailAsync([FromRoute] string email, [FromQuery] int pageSize, [FromQuery] string paymentId)
        {
            try
            {
                _logger.LogInformation("ViewPaymentListByEmail API called.");

                var result = await _mediator.Send(new ViewPaymentByUserIdQuery(email, pageSize, paymentId));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewPaymentListByEmail attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<List<Payment>>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewPaymentListByEmail completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<List<Payment>>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-payment-list-by-email at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/remaining-duration")]
        public async Task<IActionResult> ViewPaymentRemainingDurationAsync([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("ViewPaymentRemainingDuration API called.");

                var result = await _mediator.Send(new ViewLastedPaymentExpiredQuery(email));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ViewPaymentRemainingDuration attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<Payment>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("ViewPaymentRemainingDuration completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<Payment>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing view-payment-remaining-duration at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("accounts/{email}/free-trial")]
        public async Task<IActionResult> CheckPaymentFreeTrialAsync([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("CheckPaymentFreeTrial API called.");

                var result = await _mediator.Send(new CheckPaymentFreeTrialQuery(email));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("CheckPaymentFreeTrial attempt failed - {ErrorMessage}", error.Message);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                _logger.LogInformation("CheckPaymentFreeTrial completed successfully for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing check-payment-payment-free-trial at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
