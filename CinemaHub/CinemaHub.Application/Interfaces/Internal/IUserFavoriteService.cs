using CinemaHub.Application.DTOs.Request;
using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IUserFavoriteService
    {
        Task<Result<bool>> AddFavoriteFromAPIAsync(WishListRequest wishListRequest);

        Task<Result<bool>> RemoveFavoriteFromAPIAsync(WishListRequest wishListRequest);

        Task<Result<bool>> CheckUserFavoriteFromAPIAsync(WishListRequest wishListRequest);

        Task<Result<List<UserFavorite>>> ViewAllUserFavoritesFromAPIAsync();

        Task<Result<List<UserFavorite>>> ViewUserFavoritesByEmailFromAPIAsync(string email, int pageSize, string favoriteId);

        Task<Result<List<int>>> GetMovieWishListFromAPIAsync(string email, int pageSize, string favoriteId);
        Task<Result<List<Movie>>> GetMovieByUserFavoritesFromAPIAsync(string email, int pageSize, string favoriteId);
    }
}
