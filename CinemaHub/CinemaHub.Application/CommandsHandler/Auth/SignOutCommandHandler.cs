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
    public class SignOutCommandHandler : IRequestHandler<SignOutCommand, Result<bool>>
    {
        private readonly IAuthService _authService;

        public SignOutCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<Result<bool>> Handle(SignOutCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignOutFromAPIAsync(new DTOs.Request.TokenRequest() { Email = request.Email, RefreshToken = request.RefreshToken });
        }
    }
}
