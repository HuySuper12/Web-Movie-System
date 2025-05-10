using CinemaHub.Application.DTOs.Response;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class SignInCommand : IRequest<Result<SignInResponse>>
    {
        public string Email { get; set; }
        public string Password { get; set; }

        public SignInCommand(string email, string password)
        {
            Email = email;
            Password = password;
        }
    }
}
