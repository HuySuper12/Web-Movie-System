using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using CinemaHub.Infrastructure.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class UserFavoriteRepository : IUserFavoriteRepository
    {
        private readonly CinemaHubContext _context;

        public UserFavoriteRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void AddFavoriteAsync(UserFavorite userFavorite)
        {
            _context.UserFavorites.Add(userFavorite);
        }

        public async Task<bool> CheckUserFavoriteAsync(UserFavorite userFavorite)
        {
            var result = await _context.UserFavorites.FirstOrDefaultAsync(u => u.UserId == userFavorite.UserId && u.MovieId == userFavorite.MovieId);
            if (result == null)
            {
                return false;
            }
            return true;
        }

        public async Task<UserFavorite> GetFavoriteAsync(UserFavorite userFavorite)
        {
            var result = await _context.UserFavorites.AsNoTracking().FirstOrDefaultAsync(u => u.UserId == userFavorite.UserId && u.MovieId == userFavorite.MovieId);
            if (result != null)
            {
                _context.AttachIfNotTracked(result);
            }
            return result;
        }

        public void RemoveFavoriteAsync(UserFavorite userFavorite)
        {
            _context.UserFavorites.Remove(userFavorite);
        }

        public async Task<List<UserFavorite>> ViewAllUserFavoritesAsync()
        {
            return await _context.UserFavorites.Include("Movie").AsNoTracking().ToListAsync();
        }

        public async Task<List<UserFavorite>> ViewUserFavoritesByUserIdAsync(string userId, int pageSize, string id)
        {
            var query = _context.UserFavorites.Where(u => u.UserId == userId).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(id))
            {
                query = query.Where(u => u.FavoriteId < int.Parse(id)).OrderByDescending(p => p.FavoriteId);
            }

            return await query.Include("Movie").Take(pageSize).ToListAsync();
        }
    }
}
