using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class VerifyOtpCommand : IRequest<Result<bool>>
    {
        public string Email { get; set; }
        public string Otp { get; set; }

        public VerifyOtpCommand(string email, string otp)
        {
            Email = email;
            Otp = otp;
        }
    }
}
