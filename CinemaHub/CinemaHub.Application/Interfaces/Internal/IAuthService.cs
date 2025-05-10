using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using FluentResults;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IAuthService
    {
        Task<Result<SignInResponse>> SignInFromAPIAsync(SignInRequest signIn);
        
        Task<Result<SignInResponse>> SignInEmailFromAPIAsync(SignInGoogleRequest signInGoogleRequest);

        Task<Result<bool>> SignOutFromAPIAsync(TokenRequest tokenRequest);

        Task<Result<string>> RenewAccessToken(TokenRequest tokenRequest);

        Task<IdentityResult> SignUpUserFromAPIAsync(SignUpUserRequest signUpUser);

        Task<IdentityResult> SignUpStaffFromAPIAsync(SignUpUserRequest signUpUser);

        Task<Result<bool>> SendOTPAsync(string email);

        Task<Result<bool>> VerifyOTPAsync(string email, string otp);

        Task<Result<bool>> ResetPasswordAsync(string email, string newPassword);
    }
}
