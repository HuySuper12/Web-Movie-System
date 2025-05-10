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
    public class ViewProfileEmailQueryHandler : IRequestHandler<ViewProfileEmailQuery, Result<AccountResponse>>
    {
        private readonly IAccountService _accountService;

        public ViewProfileEmailQueryHandler(IAccountService accountService)
        {
            _accountService = accountService;
        }

        public async Task<Result<AccountResponse>> Handle(ViewProfileEmailQuery request, CancellationToken cancellationToken)
        {
            return await _accountService.ViewProfileByEmailFromAPIAsync(request.Email);
        }
    }
}
