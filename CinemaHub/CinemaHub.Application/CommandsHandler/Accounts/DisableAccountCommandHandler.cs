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
    public class DisableAccountCommandHandler : IRequestHandler<DisableAccountCommand, IdentityResult>
    {
        private readonly IAccountService _accountService;

        public DisableAccountCommandHandler(IAccountService accountService)
        {
            _accountService = accountService;
        }

        public async Task<IdentityResult> Handle(DisableAccountCommand request, CancellationToken cancellationToken)
        {
            return await _accountService.DisableAccountCustomerFromAPIAsync(request.Email);
        }
    }
}
