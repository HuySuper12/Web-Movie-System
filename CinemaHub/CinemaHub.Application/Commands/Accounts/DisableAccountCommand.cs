using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Account
{
    public class DisableAccountCommand : IRequest<IdentityResult>
    {
        public string Email { get; set; }
        public DisableAccountCommand(string email)
        {
            Email = email;
        }
    }
}
