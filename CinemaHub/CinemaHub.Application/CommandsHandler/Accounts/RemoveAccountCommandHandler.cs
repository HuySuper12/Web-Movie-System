using CinemaHub.Application.Commands.Account;
using CinemaHub.Application.Interfaces.Internal;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Account
{
    public class RemoveAccountCommandHandler : IRequestHandler<RemoveAccountCommand, IdentityResult>
    {
        private readonly IAccountService _accountService;

        public RemoveAccountCommandHandler(IAccountService accountService)
        {
            _accountService = accountService;
        }

        public async Task<IdentityResult> Handle(RemoveAccountCommand request, CancellationToken cancellationToken)
        {
            return await _accountService.RemoveAccountStaffFromAPIAsync(request.Email);
        }
    }
}
