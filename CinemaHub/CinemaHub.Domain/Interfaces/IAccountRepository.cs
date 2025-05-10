using CinemaHub.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IAccountRepository
    {
        Task<Account> ViewProfileByIdAsync(string id);
        Task<Account> ViewProfileByEmailAsync(string email);

        Task<List<Account>> ViewAccountsByRoleAsync(string role); //Dung ViewAll

        Task<List<Account>> ViewAccountsByRoleAsync(string role, int pageSize, string userId); //Dung View Phan trang

        void UpdateAccountAsync(Account account);

        void RemoveAccountStaffAsync(Account account);

        void DisableAccountCustomerAsync(Account account);

        Task AutoUnlockAccountCustomerAsync();
    }
}
