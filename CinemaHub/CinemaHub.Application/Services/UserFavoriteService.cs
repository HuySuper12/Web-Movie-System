using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class UserFavoriteService : IUserFavoriteService
    {
        private readonly IUserFavoriteRepository _userFavoriteRepository;
        private readonly IMovieRepository _movieRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;

        public UserFavoriteService(IUserFavoriteRepository userFavoriteRepository, IMovieRepository movieRepository, IAccountRepository accountRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _userFavoriteRepository = userFavoriteRepository;
            _movieRepository = movieRepository;
            _accountRepository = accountRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> AddFavoriteFromAPIAsync(WishListRequest wishListRequest)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(wishListRequest.MovieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var account = await _accountRepository.ViewProfileByEmailAsync(wishListRequest.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var userFavorite = new UserFavorite
            {
                UserId = account.Id,
                MovieId = wishListRequest.MovieId
            };
            var result = await _userFavoriteRepository.GetFavoriteAsync(userFavorite);
            if (result != null)
            {
                return Result.Fail<bool>(new Error("WishList existed").WithMetadata("StatusCode", 409));
            }

            _userFavoriteRepository.AddFavoriteAsync(userFavorite);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den UserFavorite
            await _responseCache.DeleteKeyInRedis("UserFavorite");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> CheckUserFavoriteFromAPIAsync(WishListRequest wishListRequest)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(wishListRequest.MovieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var account = await _accountRepository.ViewProfileByEmailAsync(wishListRequest.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var userFavorite = new UserFavorite
            {
                UserId = account.Id,
                MovieId = wishListRequest.MovieId
            };
            var result = await _userFavoriteRepository.CheckUserFavoriteAsync(userFavorite);
            return Result.Ok(result);
        }

        public async Task<Result<List<Movie>>> GetMovieByUserFavoritesFromAPIAsync(string email, int pageSize, string favoriteId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Movie>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _userFavoriteRepository.ViewUserFavoritesByUserIdAsync(account.Id, pageSize, favoriteId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("WishList not found").WithMetadata("StatusCode", 404));
            }

            var list = result.Select(x => x.MovieId).ToList();
            var listMovie = new List<Movie>();
            for (int i = 0; i < list.Count; i++)
            {
                var movie = await _movieRepository.ViewMovieHistoryByIdAsync(result[i].MovieId);
                listMovie.Add(movie);
            }

            return Result.Ok(listMovie);
        }

        public async Task<Result<List<int>>> GetMovieWishListFromAPIAsync(string email, int pageSize, string favoriteId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<int>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _userFavoriteRepository.ViewUserFavoritesByUserIdAsync(account.Id, pageSize, favoriteId);
            if (result.Count == 0)
            {
                return Result.Fail<List<int>>(new Error("WishList not found").WithMetadata("StatusCode", 404));
            }

            var list = result.Select(x => x.MovieId).ToList();
            return Result.Ok(list);
        }

        public async Task<Result<bool>> RemoveFavoriteFromAPIAsync(WishListRequest wishListRequest)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(wishListRequest.MovieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var account = await _accountRepository.ViewProfileByEmailAsync(wishListRequest.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var userFavorite = new UserFavorite
            {
                UserId = account.Id,
                MovieId = wishListRequest.MovieId
            };
            var result = await _userFavoriteRepository.GetFavoriteAsync(userFavorite);
            if (result == null)
            {
                return Result.Fail<bool>(new Error("WishList not existed").WithMetadata("StatusCode", 404));
            }

            _userFavoriteRepository.RemoveFavoriteAsync(result);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den UserFavorite
            await _responseCache.DeleteKeyInRedis("UserFavorite");
            return Result.Ok(true);
        }

        public async Task<Result<List<UserFavorite>>> ViewAllUserFavoritesFromAPIAsync()
        {
            var result = await _userFavoriteRepository.ViewAllUserFavoritesAsync();
            if(result.Count == 0)
            {
                return Result.Fail<List<UserFavorite>>(new Error("WishList not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<UserFavorite>>> ViewUserFavoritesByEmailFromAPIAsync(string email, int pageSize, string favoriteId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<UserFavorite>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _userFavoriteRepository.ViewUserFavoritesByUserIdAsync(account.Id, pageSize, favoriteId);
            if (result.Count == 0)
            {
                return Result.Fail<List<UserFavorite>>(new Error("WishList not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
