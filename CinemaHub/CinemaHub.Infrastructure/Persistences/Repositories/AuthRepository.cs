using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;


namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class AuthRepository : IAuthRepository
    {
        private readonly UserManager<Account> _userManager; //Quan ly user (Class dung Identity)
        private readonly RoleManager<IdentityRole> _roleManager; //Quan ly role
        private readonly SignInManager<Account> _signInManager; //Quan ly dang nhap
        private readonly IConfiguration _configuration; //Doc file appsettings.json de lay secret key
        private readonly CinemaHubContext _context;

        public AuthRepository(UserManager<Account> userManager, RoleManager<IdentityRole> roleManager, SignInManager<Account> signInManager, IConfiguration configuration, CinemaHubContext context)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _context = context;
        }

        public void AddRefreshToken(string refreshToken, string userId)
        {
            var token = new UserRefreshToken()
            {
                CreatedAt = DateTime.UtcNow,
                ExpiresAt = DateTime.UtcNow.AddDays(7),
                Revoked = false,
                Token = refreshToken,
                UserId = userId
            };
            _context.UserRefreshTokens.Add(token);
        }

        public async Task<string> GenerateToken(Account? user)
        {
            var authClaims = new List<Claim>
            {
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()), //Tao ra 1 chuoi token ngau nhien 
            };

            var userRoles = await _userManager.GetRolesAsync(user);
            foreach (var userRole in userRoles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, userRole));
            }

            var authenKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));

            var token = new JwtSecurityToken(
                issuer: _configuration["JWT:ValidIssuer"],
                audience: _configuration["JWT:ValidAudience"],
                claims: authClaims,
                expires: DateTime.Now.AddHours(int.Parse(_configuration["JWT:ExpiryHours"])),
                signingCredentials: new SigningCredentials(authenKey, SecurityAlgorithms.HmacSha256)
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public async Task<UserRefreshToken> SearchRefreshToken(string refreshToken, string userId)
        {
            return await _context.UserRefreshTokens.FirstOrDefaultAsync(p => p.Token == refreshToken && p.UserId == userId && p.Revoked == false);
        }

        public void RemoveRefreshToken(UserRefreshToken token)
        {
            _context.UserRefreshTokens.Update(token);
        }

        public async Task<IdentityResult> SignUpAsync(Account account, string role, string password)
        {
            var result = await _userManager.CreateAsync(account, password);

            if (result.Succeeded)
            {
                if(role.ToLower() == "staff")
                {
                    await _roleManager.CreateAsync(new IdentityRole(ApplicationRoles.Staff));
                    await _userManager.AddToRoleAsync(account, ApplicationRoles.Staff);
                } 
                else if (role.ToLower() == "manager")
                {
                    await _roleManager.CreateAsync(new IdentityRole(ApplicationRoles.Manager));
                    await _userManager.AddToRoleAsync(account, ApplicationRoles.Manager);
                }
                else
                {
                    await _roleManager.CreateAsync(new IdentityRole(ApplicationRoles.User));
                    await _userManager.AddToRoleAsync(account, ApplicationRoles.User);
                } 
            }

            return result;
        }
    }
}
