using Azure;
using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class AuthService : IAuthService
    {
        private readonly UserManager<Account> _userManager;
        private readonly IConfiguration _configuration;
        private readonly IAuthRepository _authRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IEmailForm _emailForm;
        private readonly IEmailService _emailService;
        private readonly IUnitOfWork _unitOfWork;

        public AuthService(UserManager<Account> userManager, IConfiguration configuration, IAuthRepository authRepository, IAccountRepository accountRepository, IEmailForm emailForm, IEmailService emailService, IUnitOfWork unitOfWork)
        {
            _userManager = userManager;
            _configuration = configuration;
            _authRepository = authRepository;
            _accountRepository = accountRepository;
            _emailForm = emailForm;
            _emailService = emailService;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<SignInResponse>> SignInFromAPIAsync(SignInRequest signIn)
        {
            var user = await _userManager.FindByEmailAsync(signIn.Email);
            if (user == null)
            {
                return Result.Fail<SignInResponse>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var passwordValid = await _userManager.CheckPasswordAsync(user, signIn.Password);
            if (!passwordValid)
            {
                return Result.Fail<SignInResponse>(new Error("Invalid password").WithMetadata("StatusCode", 400));
            }

            if (user.Status == false)
            {
                return Result.Fail<SignInResponse>(new Error("Your account has been banned").WithMetadata("StatusCode", 403));
            }

            var token = await _authRepository.GenerateToken(user);
            var refreshToken = Guid.NewGuid().ToString();
            _authRepository.AddRefreshToken(refreshToken, user.Id);
            await _unitOfWork.SaveChangesAsync();
            var result = new SignInResponse() { AccessToken = token, RefreshToken = refreshToken };
            return Result.Ok(result);
        }

        public async Task<Result<SignInResponse>> SignInEmailFromAPIAsync(SignInGoogleRequest signInGoogleRequest)
        {
            var user = await _userManager.FindByEmailAsync(signInGoogleRequest.Email);

            if (user == null)
            {
                Account register = new Account()
                {
                    Email = signInGoogleRequest.Email,
                    FullName = signInGoogleRequest.FullName,
                };
                await _authRepository.SignUpAsync(register, "user", "Abc123@");

                var searchUser = await _accountRepository.ViewProfileByEmailAsync(signInGoogleRequest.Email);
                searchUser.ProfilePicture = signInGoogleRequest.Picture;
                _accountRepository.UpdateAccountAsync(searchUser);
            }

            if (user.Status == false)
            {
                return Result.Fail<SignInResponse>(new Error("Your account has been banned").WithMetadata("StatusCode", 403));
            }

            var token = await _authRepository.GenerateToken(user);
            var refreshToken = Guid.NewGuid().ToString();
            _authRepository.AddRefreshToken(refreshToken, user.Id);
            await _unitOfWork.SaveChangesAsync();
            var result = new SignInResponse() { AccessToken = token, RefreshToken = refreshToken };
            return Result.Ok(result);
        }

        public async Task<IdentityResult> SignUpStaffFromAPIAsync(SignUpUserRequest signUpUser)
        {
            var search = await _accountRepository.ViewProfileByEmailAsync(signUpUser.Email);
            if (search != null)
            {
                return IdentityResult.Failed(new IdentityError
                {
                    Description = "Email already exists"
                });
            }

            var user = new Account
            {
                FullName = signUpUser.FullName,
                Email = signUpUser.Email,
                UserName = signUpUser.Email,
                PhoneNumber = signUpUser.Phone,
                CreatedAt = DateTime.Now,
                Status = true,
                ViolationCount = 0
            };

            var result = await _authRepository.SignUpAsync(user, "staff", signUpUser.Password);
            return result;
        }

        public async Task<IdentityResult> SignUpUserFromAPIAsync(SignUpUserRequest signUpUser)
        {
            var search = await _accountRepository.ViewProfileByEmailAsync(signUpUser.Email);
            if (search != null)
            {
                return IdentityResult.Failed(new IdentityError
                {
                    Description = "Email already exists"
                });
            }

            var user = new Account
            {
                FullName = signUpUser.FullName,
                Email = signUpUser.Email,
                UserName = signUpUser.Email,
                PhoneNumber = signUpUser.Phone,
                CreatedAt = DateTime.Now,
                Status = true,
                ViolationCount = 0
            };

            var result = await _authRepository.SignUpAsync(user, "user", signUpUser.Password);
            return result;
        }

        public async Task<Result<bool>> SendOTPAsync(string email)
        {
            var otpExpiration = _configuration["OtpSettings:ExpirationMinutes"];

            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return Result.Fail<bool>(new Error("Not found email").WithMetadata("StatusCode", 404));
            }

            var otp = new Random().Next(100000, 999999).ToString();
            user.OtpCode = otp;
            user.OtpExpiration = DateTime.Now.AddMinutes(int.Parse(otpExpiration));
            await _userManager.UpdateAsync(user);

            var mail = _emailForm.OtpForm(user, otp);
            await _emailService.SendEmailAsync(user.Email, mail.Subject, mail.Body);
            return Result.Ok(true);
        }

        public async Task<Result<bool>> VerifyOTPAsync(string email, string otp)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return Result.Fail<bool>(new Error("Not found email").WithMetadata("StatusCode", 404));
            }

            if (user.OtpCode != otp)
            {
                return Result.Fail<bool>(new Error("Invalid OTP").WithMetadata("StatusCode", 400));
            }

            if(user.OtpExpiration < DateTime.Now)
            {
                return Result.Fail<bool>(new Error("OTP has been expired").WithMetadata("StatusCode", 400));
            }

            return Result.Ok(true);
        }

        public async Task<Result<bool>> ResetPasswordAsync(string email, string newPassword)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return Result.Fail<bool>(new Error("Not found email").WithMetadata("StatusCode", 404));
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            var resetPassword = await _userManager.ResetPasswordAsync(user, token, newPassword);

            if (resetPassword.Succeeded)
            {
                user.OtpCode = null;
                user.OtpExpiration = null;
                await _userManager.UpdateAsync(user);
                return Result.Ok(true);
            }
            return Result.Fail<bool>(new Error("Reset password fail").WithMetadata("StatusCode", 400));
        }

        public async Task<Result<bool>> SignOutFromAPIAsync(TokenRequest tokenRequest)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(tokenRequest.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Not found email").WithMetadata("StatusCode", 404));
            }


            var token = await _authRepository.SearchRefreshToken(tokenRequest.RefreshToken, account.Id);
            if (token == null)
            {
                return Result.Fail<bool>(new Error("Not found token").WithMetadata("StatusCode", 404));
            }
            token.Revoked = true;
            _authRepository.RemoveRefreshToken(token);
            await _unitOfWork.SaveChangesAsync();
            return Result.Ok(true);
        }

        public async Task<Result<string>> RenewAccessToken(TokenRequest tokenRequest)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(tokenRequest.Email);
            if(account == null)
            {
                return Result.Fail<string>(new Error("Not found email").WithMetadata("StatusCode", 404));
            }

            var token = await _authRepository.SearchRefreshToken(tokenRequest.RefreshToken, account.Id);
            if (token == null)
            {
                return Result.Fail<string>(new Error("Not found token").WithMetadata("StatusCode", 404));
            }

            if(account.Status == false)
            {
                return Result.Fail<string>(new Error("Your account has been banned").WithMetadata("StatusCode", 403));
            }

            if (token.ExpiresAt < DateTime.UtcNow)
            {
                _authRepository.RemoveRefreshToken(token);
                await _unitOfWork.SaveChangesAsync();
                return null;
            }      
            return await _authRepository.GenerateToken(account);                   
        }
    }
}
