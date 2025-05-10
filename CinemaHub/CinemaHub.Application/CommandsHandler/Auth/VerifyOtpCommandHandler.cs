using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Auth
{
    public class VerifyOtpCommandHandler : IRequestHandler<VerifyOtpCommand, Result<bool>>
    {
        private readonly IAuthService _authService;

        public VerifyOtpCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<Result<bool>> Handle(VerifyOtpCommand request, CancellationToken cancellationToken)
        {
            return await _authService.VerifyOTPAsync(request.Email, request.Otp);
        }
    }
}
