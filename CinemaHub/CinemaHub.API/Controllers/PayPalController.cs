using CinemaHub.API.Models;
using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Infrastructure.Payments.MoMo;
using CinemaHub.Infrastructure.Payments.PayPal;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayPalController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<PayPalController> _logger;
        private readonly IPayPalService _paypalService;
        private readonly IConfiguration _configuration;

        public PayPalController(IMediator mediator, ILogger<PayPalController> logger, IPayPalService paypalService, IConfiguration configuration)
        {
            _mediator = mediator;
            _logger = logger;
            _paypalService = paypalService;
            _configuration = configuration;
        }

        [HttpPost("link")]
        public async Task<IActionResult> CreatePayment(PaymentInformationModel paymentInfo)
        {
            try
            {
                _logger.LogInformation("CreatePayPalURL API called.");
                var payment = new Infrastructure.Payments.PaymentInformation()
                {
                    UserEmail = paymentInfo.UserEmail,
                    Amount = paymentInfo.Amount,
                    ExpiryDate = paymentInfo.ExpiryDate,
                    SubscriptionPlanId = paymentInfo.SubscriptionPlanId,
                };

                var result = await _paypalService.CreatePayment(payment);
                if (string.IsNullOrEmpty(result))
                {
                    _logger.LogWarning("CreatePayPalURL attempt failed");
                    return BadRequest(ApiResponse<string>.ErrorResponse("Please configure the parameters: vnp_TmnCode and vnp_HashSecret.", 400));
                }

                _logger.LogInformation("CreatePayPalURL completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<string>.SuccessResponse(result));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-paypal-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("success-payment/{paymentCode}")]
        public async Task<IActionResult> PayPalSuccessUrl([FromRoute] string paymentCode)
        {
            try
            {
                _logger.LogInformation("PayPalSuccessUrl API called.");
                var result = await _paypalService.SuccessPayment(paymentCode);
                if (result != null)
                {
                    await _mediator.Publish(new BillPaymentEvent(result));
                    _logger.LogInformation("PayPalSuccessUrl completed successfully at {Time}", DateTime.UtcNow);
                    return Redirect(_configuration["PayPal:URLSuccess"]); 
                }

                _logger.LogWarning("PayPalSuccessUrl attempt failed");
                return BadRequest(ApiResponse<string>.ErrorResponse("Not found payment", 404));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing paypal-success-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        //URL tu cap nhat nen de GET
        [HttpGet("fail-payment/{paymentCode}")]
        public async Task<IActionResult> FailPayment([FromRoute] string paymentCode)
        {
            try
            {
                _logger.LogInformation("PayPalSuccessUrl API called.");
                var result = await _paypalService.SuccessPayment(paymentCode);
                if (result != null)
                {
                    _logger.LogInformation("PayPalSuccessUrl completed successfully at {Time}", DateTime.UtcNow);
                    return Redirect(_configuration["PayPal:URLFail"]);
                }

                _logger.LogWarning("PayPalSuccessUrl attempt failed");
                return BadRequest(ApiResponse<string>.ErrorResponse("Not found payment", 404));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing paypal-success-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
