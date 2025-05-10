using CinemaHub.Application.Commands.Auth;
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
    public class SignInGoogleCommandHandler : IRequestHandler<SignInGoogleCommand, Result<SignInResponse>>
    {
        private readonly IAuthService _authService;

        public SignInGoogleCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<Result<SignInResponse>> Handle(SignInGoogleCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignInEmailFromAPIAsync(new DTOs.Request.SignInGoogleRequest
            {
                Email = request.Email,
                Picture = request.Picture,
                FullName = request.FullName
            });
        }
    }
}
