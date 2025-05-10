using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Auth
{
    public class SendOtpCommand : IRequest<Result<bool>>
    {
        public string Email { get; set; }

        public SendOtpCommand(string email)
        {
            Email = email;
        }
    }
}
