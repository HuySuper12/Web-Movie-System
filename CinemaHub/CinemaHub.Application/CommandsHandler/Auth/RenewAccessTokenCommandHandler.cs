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
    public class RenewAccessTokenCommandHandler : IRequestHandler<RenewAccessTokenCommand,Result<string>>
    {
        private readonly IAuthService _authService;

        public RenewAccessTokenCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<Result<string>> Handle(RenewAccessTokenCommand request, CancellationToken cancellationToken)
        {
            return await _authService.RenewAccessToken(new DTOs.Request.TokenRequest() { Email = request.Email, RefreshToken = request.RefreshToken });
        }

        
    }
}
