using CinemaHub.API.Models;
using CinemaHub.Application.Events;
using CinemaHub.Infrastructure.Payments.VNPay;
using MediatR;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VNPayController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<VNPayController> _logger;
        private readonly IVNPAYService _vnpayService;
        private readonly IConfiguration _configuration;

        public VNPayController(IMediator mediator, ILogger<VNPayController> logger, IVNPAYService vnpayService, IConfiguration configuration)
        {
            _mediator = mediator;
            _logger = logger;
            _vnpayService = vnpayService;
            _configuration = configuration;
        }

        [HttpPost("link")]
        public async Task<IActionResult> CreateVNPAYURL([FromBody] PaymentInformationModel paymentInfo)
        {
            try
            {
                _logger.LogInformation("CreateVNPAYURL API called.");

                var payment = new Infrastructure.Payments.PaymentInformation()
                {
                    UserEmail = paymentInfo.UserEmail,
                    Amount = paymentInfo.Amount,
                    ExpiryDate = paymentInfo.ExpiryDate,
                    SubscriptionPlanId = paymentInfo.SubscriptionPlanId,
                };

                var result = await _vnpayService.CreateVNPAYURL(payment);
                if (string.IsNullOrEmpty(result))
                {
                    _logger.LogWarning("CreateVNPAYURL attempt failed");
                    return BadRequest(ApiResponse<string>.ErrorResponse("Please configure the parameters: vnp_TmnCode and vnp_HashSecret.", 400));
                }
                _logger.LogInformation("CreateVNPAYURL completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<string>.SuccessResponse(result));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-vnpay-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [EnableCors("MyCors")]
        [HttpPost("ipn")]
        public async Task<IActionResult> VnPayIpnUrl([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                _logger.LogInformation("VnPayIpnUrl API called.");
                var result = await _vnpayService.VnPayIpnUrl(queryParams);
                if (result)
                {
                    _logger.LogInformation("VnPayIpnUrl completed successfully at {Time}", DateTime.UtcNow);
                    return Ok(ApiResponse<bool>.SuccessResponse(result));
                }

                _logger.LogWarning("VnPayIpnUrl attempt failed");
                return BadRequest(ApiResponse<string>.ErrorResponse("Not found payment", 404));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing vnpay-ipn-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("return-url")]
        public async Task<IActionResult> ReturnURL([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                _logger.LogInformation("ReturnURL API called.");

                var result = await _vnpayService.ReturnURL(queryParams);
                if (result != null)
                {
                    await _mediator.Publish(new BillPaymentEvent(result));
                    _logger.LogInformation("ReturnURL completed successfully at {Time}", DateTime.UtcNow);
                    return Redirect(_configuration["VNPAY:URLSuccess"]);
                }
                _logger.LogWarning("ReturnURL attempt failed");
                return Redirect(_configuration["VNPAY:URLFail"]);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing vnpay-return-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
