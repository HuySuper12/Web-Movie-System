using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using FluentResults;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IAccountService
    {
        Task<Result<AccountResponse>> ViewProfileByIdFromAPIAsync(string id);
        Task<Result<AccountResponse>> ViewProfileByEmailFromAPIAsync(string email);

        Task<Result<List<AccountResponse>>> ViewAccountsByRoleFromAPIAsync(string role);
        Task<Result<List<AccountResponse>>> ViewAccountsByRoleFromAPIAsync(string role, int pageSize, string userId);

        Task<IdentityResult> UpdateAccountFromAPIAsync(UpdateAccountRequest account);

        Task<IdentityResult> RemoveAccountStaffFromAPIAsync(string email);

        Task<IdentityResult> DisableAccountCustomerFromAPIAsync(string email);

        Task AutoUnlockAccountCustomerFromAPIAsync();
    }
}
