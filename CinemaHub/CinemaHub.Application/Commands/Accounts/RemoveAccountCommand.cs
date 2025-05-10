using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Account
{
    public class RemoveAccountCommand : IRequest<IdentityResult>
    {
        public string Email { get; set; }
        public RemoveAccountCommand(string email)
        {
            Email = email;
        }
    }
}
