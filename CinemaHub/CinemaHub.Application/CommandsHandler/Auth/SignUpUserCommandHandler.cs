using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.Interfaces.Internal;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Auth
{
    public class SignUpUserCommandHandler : IRequestHandler<SignUpUserCommand, IdentityResult>
    {
        private readonly IAuthService _authService;

        public SignUpUserCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<IdentityResult> Handle(SignUpUserCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignUpUserFromAPIAsync(new DTOs.Request.SignUpUserRequest()
            {
                FullName = request.FullName,
                Email = request.Email,
                Phone = request.Phone,
                Password = request.Password,
                ConfirmPassword = request.ConfirmPassword,
            });
        }
    }
}
