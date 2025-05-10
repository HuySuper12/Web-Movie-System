using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IUserFavoriteRepository
    {
        void AddFavoriteAsync(UserFavorite userFavorite);

        void RemoveFavoriteAsync(UserFavorite userFavorite);

        Task<bool> CheckUserFavoriteAsync(UserFavorite userFavorite);

        Task<UserFavorite> GetFavoriteAsync(UserFavorite userFavorite);

        Task<List<UserFavorite>> ViewAllUserFavoritesAsync();

        Task<List<UserFavorite>> ViewUserFavoritesByUserIdAsync(string userId, int pageSize, string id);
    }
}
