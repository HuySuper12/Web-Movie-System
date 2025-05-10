using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.Interfaces.Internal;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Auth
{
    public class SignUpStaffCommandHandler : IRequestHandler<SignUpStaffCommand, IdentityResult>
    {
        private readonly IAuthService _authService;

        public SignUpStaffCommandHandler(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<IdentityResult> Handle(SignUpStaffCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignUpStaffFromAPIAsync(new DTOs.Request.SignUpUserRequest()
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
