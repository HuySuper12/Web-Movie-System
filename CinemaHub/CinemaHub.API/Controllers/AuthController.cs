using CinemaHub.API.Filters;
using CinemaHub.API.Models;
using CinemaHub.Application.Commands;
using CinemaHub.Application.Commands.Auth;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using FluentResults;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.Extensions.Logging;
using static System.Runtime.InteropServices.JavaScript.JSType;
using CinemaHub.Infrastructure.Persistences;
using Microsoft.AspNetCore.Authorization;
using CinemaHub.Application.DTOs.Response;
using Microsoft.AspNetCore.Identity;

namespace CinemaHub.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<AuthController> _logger;

        public AuthController(IMediator mediator, ILogger<AuthController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        [HttpGet("test-auth")]
        [Authorize(Roles = "Manager")]
        public IActionResult TestAuth()
        {
            var role = User.Claims.FirstOrDefault(c => c.Type.Contains("role"))?.Value;
            return Ok(new { Message = "Authorized", Role = role });
        }

        [HttpPost("sign-in")]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> SignIn([FromBody] SignInModel signIn)
        {
            try
            {
                _logger.LogInformation("SignIn API called.");

                var signInCommand = new SignInCommand(signIn.Email, signIn.Password);
                var result = await _mediator.Send(signInCommand);

                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;

                    _logger.LogWarning("SignIn attempt failed for Email {Email} - {ErrorMessage}", signIn.Email, error.Message);
                    return BadRequest(ApiResponse<SignInResponse>.ErrorResponse(error.Message, statusCode));
                }

                //Gui Cookie
                HttpContext.Response.Cookies.Append("refreshToken", result.Value.RefreshToken, new CookieOptions
                {
                    HttpOnly = true, // Ngăn truy cập JS → bảo mật
                    Secure = true, // Bắt buộc với HTTPS
                    SameSite = SameSiteMode.None,
                    Expires = DateTimeOffset.UtcNow.AddDays(7), // Thời gian sống của cookie
                });

                _logger.LogInformation("SignIn completed successfully for Email {Email} at {Time}", signIn.Email, DateTime.UtcNow);
                return Ok(ApiResponse<SignInResponse>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing sign-in for Email {Email} at {Time}. Exception: {ExceptionMessage}", signIn.Email, DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("sign-in/google/{token}")]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> SignInGoogle([FromRoute] string token)
        {
            try
            {
                _logger.LogInformation("SignInGoogle API called.");

                var jwtTokenHandler = new JwtSecurityTokenHandler();
                var jsonToken = jwtTokenHandler.ReadToken(token) as JwtSecurityToken;
                var email = jsonToken.Claims.First(claim => claim.Type == "email").Value;
                var name = jsonToken.Claims.First(claim => claim.Type == "name").Value;
                var picture = jsonToken.Claims.First(claim => claim.Type == "picture").Value;

                var result = await _mediator.Send(new SignInGoogleCommand(email, name, picture));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SignIn attempt failed for Email {Email} - {ErrorMessage}", email, error.Message);
                    return BadRequest(ApiResponse<SignInResponse>.ErrorResponse(error.Message, statusCode));   
                }

                //Gui Cookie
                HttpContext.Response.Cookies.Append("refreshToken", result.Value.RefreshToken, new CookieOptions
                {
                    HttpOnly = true, // Ngăn truy cập JS → bảo mật
                    Secure = true, // Bắt buộc với HTTPS
                    SameSite = SameSiteMode.None,
                    Expires = DateTimeOffset.UtcNow.AddDays(7), // Thời gian sống của cookie
                });

                _logger.LogInformation("SignInGoogle completed successfully for Email {Email} at {Time}", email, DateTime.Now);
                return Ok(ApiResponse<SignInResponse>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing sign-in-google for email by Google at {Time}. Exception: {ExceptionMessage}", DateTime.Now, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("sign-up/user")]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> SignUpUser([FromBody] SignUpUserModel signUpUser)
        {
            try
            {
                _logger.LogInformation("SignUpUser API called.");

                var signUp = new SignUpUserCommand(signUpUser.FullName, signUpUser.Email, signUpUser.Phone, signUpUser.Password, signUpUser.ConfirmPassword);
                var result = await _mediator.Send(signUp);

                if (result.Succeeded)
                {
                    _logger.LogInformation("SignUpUser completed successfully for Email {Email} at {Time}", signUpUser.Email, DateTime.UtcNow);
                    return Ok((ApiResponse<IdentityResult>.SuccessResponse(result)));
                } 
                else
                {
                    string errors = "";
                    foreach (var error in result.Errors)
                    {
                        _logger.LogWarning(error.Description);
                        errors += error.Description + ", ";  
                    }
                    return BadRequest(ApiResponse<string>.ErrorResponse(errors, 400));
                }               
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing sign-up-user at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("sign-up/staff")]
        [TypeFilter(typeof(CustomValidationFilter))]
        [Authorize(Roles = ApplicationRoles.Manager)]
        public async Task<IActionResult> SignUpStaff([FromBody] SignUpUserModel signUpUser)
        {
            try
            {
                _logger.LogInformation("SignUpStaff API called.");

                var signUp = new SignUpStaffCommand(signUpUser.FullName, signUpUser.Email, signUpUser.Phone, signUpUser.Password, signUpUser.ConfirmPassword);
                var result = await _mediator.Send(signUp);

                if (result.Succeeded)
                {
                    _logger.LogInformation("SignUpStaff completed successfully for Email {Email} at {Time}", signUpUser.Email, DateTime.UtcNow);
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
                    return BadRequest(ApiResponse<string>.ErrorResponse(errors, 400));
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing sign-up-user at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("sign-out/{email}")]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> SignOut([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("SignOut API called.");

                var refreshToken = Request.Cookies["refreshToken"];
                var result = await _mediator.Send(new SignOutCommand(email, refreshToken));

                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SignOut attempt failed for Email {Email} at {Time}", email, DateTime.UtcNow);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }

                // Xóa refresh token cookie
                Response.Cookies.Delete("refreshToken");

                _logger.LogInformation("SignOut completed successful for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok((ApiResponse<bool>.SuccessResponse(result.Value)));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing sign-out at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("renew-access-token/{email}")]
        [TypeFilter(typeof(CustomValidationFilter))]
        public async Task<IActionResult> RenewAccessToken([FromRoute] string email)
        {
            try
            {
                _logger.LogInformation("RenewAccessToken API called.");

                var refreshToken = Request.Cookies["refreshToken"];
                var result = await _mediator.Send(new RenewAccessTokenCommand(email, refreshToken));

                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SignOut attempt failed for Email {Email} at {Time}", email, DateTime.UtcNow);
                    return BadRequest(ApiResponse<string>.ErrorResponse(error.Message, statusCode)); 
                }

                _logger.LogInformation("RenewAccessToken completed successful for Email {Email} at {Time}", email, DateTime.UtcNow);
                return Ok((ApiResponse<string>.SuccessResponse(result.Value)));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing renew-access-token at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("otp/send")]
        public async Task<IActionResult> SendOTP([FromQuery] string email)
        {
            try
            {
                _logger.LogInformation("SendOTP API called.");

                _logger.LogInformation("SendOTP completed successful for Email {Email} at {Time}", email, DateTime.UtcNow);
                var result = await _mediator.Send(new SendOtpCommand(email));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("SendOTP attempt failed for Email {Email} at {Time}", email, DateTime.UtcNow);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                       
                }
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing send-otp at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("otp/verify")]
        public async Task<IActionResult> VerifyOTP([FromBody] VerifyOtpModel verifyOtpModel)
        {
            try
            {
                _logger.LogInformation("VerifyOTP API called.");

                _logger.LogInformation("VerifyOTP completed successful for Email {Email} at {Time}", verifyOtpModel.Email, DateTime.UtcNow);
                var result = await _mediator.Send(new VerifyOtpCommand(verifyOtpModel.Email, verifyOtpModel.Otp));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("VerifyOTP attempt failed for Email {Email} at {Time}", verifyOtpModel.Email, DateTime.UtcNow);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                    
                }
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing verify-otp at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }

        [HttpPost("password/reset")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordModel resetPasswordModel)
        {
            try
            {
                _logger.LogInformation("ResetPassword API called.");

                _logger.LogInformation("ResetPassword completed successful for Email {Email} at {Time}", resetPasswordModel.Email, DateTime.UtcNow);
                var result = await _mediator.Send(new ResetPasswordCommand(resetPasswordModel.Email, resetPasswordModel.Password));
                if (result.IsFailed)
                {
                    var error = result.Errors.First();
                    var statusCode = error?.Metadata.TryGetValue("StatusCode", out var codeObj) == true && codeObj is int code
            ? code
            : 400;
                    _logger.LogWarning("ResetPassword attempt failed for Email {Email} at {Time}", resetPasswordModel.Email, DateTime.UtcNow);
                    return BadRequest(ApiResponse<bool>.ErrorResponse(error.Message, statusCode));
                }   
                return Ok(ApiResponse<bool>.SuccessResponse(result.Value));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while processing reset-password at {Time}. Exception: {ExceptionMessage}", DateTime.UtcNow, ex.Message);
                return StatusCode(500, ApiResponse<string>.ErrorResponse($"Internal server error: {ex.Message}", 500));
            }
        }
    }
}
