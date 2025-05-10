using CinemaHub.Application.Commands.Account;
using CinemaHub.Application.DTOs.Request;
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
    public class UpdateAccountCommandHandler : IRequestHandler<UpdateAccountCommand, IdentityResult>
    {
        private readonly IAccountService _accountService;

        public UpdateAccountCommandHandler(IAccountService accountService)
        {
            _accountService = accountService;
        }

        public async Task<IdentityResult> Handle(UpdateAccountCommand request, CancellationToken cancellationToken)
        {
            var updateAccount = new UpdateAccountRequest()
            {
                Email = request.Email,
                FullName = request.FullName,
                PhoneNumber = request.PhoneNumber,
                PictureUrl = request.PictureUrl
            };
            return await _accountService.UpdateAccountFromAPIAsync(updateAccount);
        }
    }
}
