using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class ResetPasswordCommand : IRequest<Result<bool>>
    {
        public string Email { get; set; }
        public string Password { get; set; }

        public ResetPasswordCommand(string email, string password)
        {
            Email = email;
            Password = password;
        }
    }
}
