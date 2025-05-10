using CinemaHub.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IAuthRepository
    {
        Task<string> GenerateToken(Account? user);
        Task<IdentityResult> SignUpAsync(Account account, string role, string password);
        void AddRefreshToken (string refreshToken, string userId);

        Task<UserRefreshToken> SearchRefreshToken(string refreshToken, string userId);
        void RemoveRefreshToken (UserRefreshToken token);
    }
}
