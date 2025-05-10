using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly CinemaHubContext _context;
        private readonly UserManager<Account> _userManager; //Quan ly user (Class dung Identity)
        public AccountRepository(CinemaHubContext context,UserManager<Account> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task AutoUnlockAccountCustomerAsync()
        {
            var accounts = await _userManager.GetUsersInRoleAsync("User");
            foreach (var account in accounts)
            {
                if (account.AccountLockUntil != null && account.AccountLockUntil < DateTime.Now)
                {
                    account.AccountLockUntil = null;
                    account.ViolationCount = 0;
                    account.Status = true;
                    _context.Accounts.Update(account);
                }
            }
        }

        public void DisableAccountCustomerAsync(Account account)
        {
            if (account.Status == true)
            {
                account.Status = false;
            }
            else
            {
                if(account.ViolationCount == 2)
                {
                    account.ViolationCount = 0;
                }
                account.Status = true;
                account.AccountLockUntil = null;
            }

            _context.Accounts.Update(account);
        }

        public void RemoveAccountStaffAsync(Account account)
        {
            _context.Accounts.Remove(account);
        }

        public void UpdateAccountAsync(Account account)
        {
            _context.Accounts.Update(account);
        }

        public async Task<List<Account>> ViewAccountsByRoleAsync(string role)
        {
            var users = await _context.Accounts.ToListAsync();
            var list = new List<Account>();

            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                if (roles.Any(r => r.Equals(role, StringComparison.OrdinalIgnoreCase)))
                {
                    list.Add(user);
                }
            }

            return list;
        }

        public async Task<List<Account>> ViewAccountsByRoleAsync(string role, int pageSize, string userId)
        {
            var list = await _userManager.GetUsersInRoleAsync(role);
            if (!string.IsNullOrEmpty(userId))
            {
                list = list.Where(u => u.Id.CompareTo(userId) < 0).OrderByDescending(p => p.Id).ToList(); // Lấy Id lớn hơn lastId
            }
            return list.Take(pageSize).ToList();
        }

        public async Task<Account> ViewProfileByEmailAsync(string email)
        {
            var user = await _context.Accounts.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email);
            return user;
        }

        public async Task<Account> ViewProfileByIdAsync(string id)
        {
            var user = await _context.Accounts.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id);
            return user;
        }
    }
}
