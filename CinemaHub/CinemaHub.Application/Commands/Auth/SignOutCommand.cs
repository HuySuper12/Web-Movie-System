using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class SignOutCommand : IRequest<Result<bool>>
    {
        public string Email { get; set; }
        public string RefreshToken { get; set; }

        public SignOutCommand(string email, string refreshToken)
        {
            Email = email;
            RefreshToken = refreshToken;
        }
    }
}
