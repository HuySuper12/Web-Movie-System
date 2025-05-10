using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
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
    public class SignInCommandHandler : IRequestHandler<SignInCommand, Result<SignInResponse>>
    {
        private readonly IAuthService _authService;

        public SignInCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<Result<SignInResponse>> Handle(SignInCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignInFromAPIAsync(new SignInRequest()
            {
                Email = request.Email,
                Password = request.Password
            });
        }
    }
}
