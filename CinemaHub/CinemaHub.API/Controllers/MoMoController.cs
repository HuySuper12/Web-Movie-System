using CinemaHub.API.Models;
using CinemaHub.Application.Events;
using CinemaHub.Infrastructure.Payments.MoMo;
using CinemaHub.Infrastructure.Payments.VNPay;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoMoController : ControllerBase
    {
        private readonly ILogger<MoMoController> _logger;
        private readonly IMoMoService _momoService;
        private readonly IConfiguration _configuration;
        private readonly IMediator _mediator;

        public MoMoController(IMediator mediator, ILogger<MoMoController> logger, IMoMoService momoService, IConfiguration configuration)
        {
            _mediator = mediator;
            _logger = logger;
            _momoService = momoService;
            _configuration = configuration;
        }

        [HttpPost("link")]
        public async Task<ActionResult<string>> CreateMoMoURL(PaymentInformationModel paymentInfo)
        {
            try
            {
                _logger.LogInformation("CreateMoMoURL API called.");
                var payment = new Infrastructure.Payments.PaymentInformation()
                {
                    UserEmail = paymentInfo.UserEmail,
                    Amount = paymentInfo.Amount,
                    ExpiryDate = paymentInfo.ExpiryDate,
                    SubscriptionPlanId = paymentInfo.SubscriptionPlanId,
                };

                var result = await _momoService.CreateMoMoURL(payment);
                if (string.IsNullOrEmpty(result))
                {
                    _logger.LogWarning("CreateMoMoURL attempt failed");
                    return BadRequest(ApiResponse<string>.ErrorResponse("Please configure the parameters: vnp_TmnCode and vnp_HashSecret.", 400));
                }

                _logger.LogInformation("CreateMoMoURL completed successfully at {Time}", DateTime.UtcNow);
                return Ok(ApiResponse<string>.SuccessResponse(result));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing create-momo-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("ipn")]
        public async Task<IActionResult> MoMoIpnUrl([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                _logger.LogInformation("MoMoIpnUrl API called.");
                var result = await _momoService.MoMoIpnUrl(queryParams);
                if (result)
                {
                    _logger.LogInformation("MoMoIpnUrl completed successfully at {Time}", DateTime.UtcNow);
                    return Ok(ApiResponse<bool>.SuccessResponse(result));
                }

                _logger.LogWarning("MoMoIpnUrl attempt failed");
                return BadRequest(ApiResponse<string>.ErrorResponse("Not found payment", 404));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing momo-ipn-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpGet("return-url")]
        public async Task<IActionResult> MoMoReturnUrl([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                _logger.LogInformation("MoMoReturnUrl API called.");
                var result = await _momoService.MoMoReturnUrl(queryParams);
                if (result != null)
                {
                    await _mediator.Publish(new BillPaymentEvent(result));
                    _logger.LogInformation("MoMoReturnUrl completed successfully at {Time}", DateTime.UtcNow);
                    return Redirect(_configuration["MoMo:URLSuccess"]);
                }

                _logger.LogWarning("MoMoReturnUrl attempt failed");
                return Redirect(_configuration["MoMo:URLFail"]); ;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing momo-return-url at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

    }
}
