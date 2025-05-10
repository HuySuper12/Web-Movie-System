using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Account;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Account
{
    public class ViewAccountRoleQueryHandler : IRequestHandler<ViewAccountRoleQuery, Result<List<AccountResponse>>>
    {
        private readonly IAccountService _accountService;

        public ViewAccountRoleQueryHandler(IAccountService accountService)
        {
            _accountService = accountService;
        }

        public async Task<Result<List<AccountResponse>>> Handle(ViewAccountRoleQuery request, CancellationToken cancellationToken)
        {
            return await _accountService.ViewAccountsByRoleFromAPIAsync(request.Role);
        }
    }
}
