using CinemaHub.Application.DTOs.Response;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class SignInGoogleCommand : IRequest<Result<SignInResponse>>
    {
        public string Email { get; set; } = null!;

        public string FullName { get; set; }

        public string Picture { get; set; }

        public SignInGoogleCommand(string email, string fullName, string picture)
        {
            Email = email;
            FullName = fullName;
            Picture = picture;
        }
    }
}
