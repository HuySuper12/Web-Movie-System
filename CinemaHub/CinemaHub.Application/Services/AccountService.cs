using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class AccountService : IAccountService
    {
        private readonly IAccountRepository _accountRepository;
        private readonly IResponseCache _responseCache;
        private readonly IUnitOfWork _unitOfWork;

        public AccountService(IAccountRepository accountRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _accountRepository = accountRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task AutoUnlockAccountCustomerFromAPIAsync()
        {
            await _accountRepository.AutoUnlockAccountCustomerAsync();
        }

        public async Task<IdentityResult> DisableAccountCustomerFromAPIAsync(string email)
        {
            var user = await _accountRepository.ViewProfileByEmailAsync(email);
            if (user == null)
            {
                return IdentityResult.Failed(new IdentityError
                {
                    Description = "UpdateAccount attempt failed - Not found user"
                });
            }
            _accountRepository.DisableAccountCustomerAsync(user);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den account
            await _responseCache.DeleteKeyInRedis("Account");

            return IdentityResult.Success;
        }

        public async Task<IdentityResult> RemoveAccountStaffFromAPIAsync(string email)
        {
            var user = await _accountRepository.ViewProfileByEmailAsync(email);
            if (user == null)
            {
                return IdentityResult.Failed(new IdentityError
                {
                    Description = $"UpdateAccount attempt failed - Not found user"
                });
            }
            _accountRepository.RemoveAccountStaffAsync(user);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den account
            await _responseCache.DeleteKeyInRedis("Account");

            return IdentityResult.Success;
        }

        public async Task<IdentityResult> UpdateAccountFromAPIAsync(UpdateAccountRequest account)
        {
            var user = await _accountRepository.ViewProfileByEmailAsync(account.Email);
            if(user == null)
            {
                return IdentityResult.Failed(new IdentityError
                {
                    Description = $"UpdateAccount attempt failed - Not found user"
                });
            }

            user.FullName = account.FullName;
            user.PhoneNumber = account.PhoneNumber;
            user.ProfilePicture = account.PictureUrl;
            _accountRepository.UpdateAccountAsync(user);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den account
            await _responseCache.DeleteKeyInRedis("Account");

            return IdentityResult.Success;
        }

        public async Task<Result<List<AccountResponse>>> ViewAccountsByRoleFromAPIAsync(string role)
        {
            var result = await _accountRepository.ViewAccountsByRoleAsync(role);
            if (result.Count == 0)
            {
                return Result.Fail<List<AccountResponse>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }
            var newList = new List<AccountResponse>();
            foreach (var account in result)
            {
                var accountResponse = new AccountResponse()
                {
                    Id = account.Id,
                    AccountLockUntil = account.AccountLockUntil,
                    Balance = account.Balance,
                    CreatedAt = account.CreatedAt,
                    Email = account.Email,
                    FullName = account.FullName,
                    OtpCode = account.OtpCode,
                    OtpExpiration = account.OtpExpiration,
                    PhoneNumber = account.PhoneNumber,
                    ProfilePicture = account.ProfilePicture,
                    Status = account.Status,
                    ViolationCount = account.ViolationCount,
                };
                newList.Add(accountResponse);
            }

            return Result.Ok(newList);
        }

        public async Task<Result<List<AccountResponse>>> ViewAccountsByRoleFromAPIAsync(string role, int pageSize, string userId)
        {
            var result = await _accountRepository.ViewAccountsByRoleAsync(role, pageSize, userId);
            if (result.Count == 0)
            {
                return Result.Fail<List<AccountResponse>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var newList = new List<AccountResponse>();
            foreach (var account in result)
            {
                var accountResponse = new AccountResponse()
                {
                    Id = account.Id,
                    AccountLockUntil = account.AccountLockUntil,
                    Balance = account.Balance,
                    CreatedAt = account.CreatedAt,
                    Email = account.Email,
                    FullName = account.FullName,
                    OtpCode = account.OtpCode,
                    OtpExpiration = account.OtpExpiration,
                    PhoneNumber = account.PhoneNumber,
                    ProfilePicture = account.ProfilePicture,
                    Status = account.Status,
                    ViolationCount = account.ViolationCount,
                };
                newList.Add(accountResponse);
            }

            return Result.Ok(newList);
        }

        public async Task<Result<AccountResponse>> ViewProfileByEmailFromAPIAsync(string email)
        {
            var result = await _accountRepository.ViewProfileByEmailAsync(email);
            if (result == null)
            {
                return Result.Fail<AccountResponse>(new Error($"Account not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(new AccountResponse()
            {
                AccountLockUntil = result.AccountLockUntil,
                Balance = result.Balance,
                CreatedAt = result.CreatedAt,
                Email = result.Email,
                FullName = result.FullName,
                OtpCode = result.OtpCode,
                OtpExpiration = result.OtpExpiration,
                PhoneNumber = result.PhoneNumber,
                ProfilePicture = result.ProfilePicture,
                Status = result.Status,
                ViolationCount = result.ViolationCount,
            });
        }

        public async Task<Result<AccountResponse>> ViewProfileByIdFromAPIAsync(string id)
        {
            var result = await _accountRepository.ViewProfileByIdAsync(id);
            if(result == null)
            { 
                return Result.Fail<AccountResponse>(new Error($"Account not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(new AccountResponse()
            {
                AccountLockUntil = result.AccountLockUntil,
                Balance = result.Balance,
                CreatedAt = result.CreatedAt,
                Email = result.Email,
                FullName = result.FullName,
                OtpCode = result.OtpCode,
                OtpExpiration = result.OtpExpiration,
                PhoneNumber = result.PhoneNumber,
                ProfilePicture = result.ProfilePicture,
                Status = result.Status,
                ViolationCount = result.ViolationCount,
            });   
        }
    }
}
