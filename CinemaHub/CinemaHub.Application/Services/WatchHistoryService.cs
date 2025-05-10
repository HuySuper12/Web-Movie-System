using CinemaHub.Application.DTOs.Response;
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
    public class WatchHistoryService : IWatchHistoryService
    {
        private readonly IWatchHistoryRepository _watchHistoryRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IMovieRepository _movieRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;

        public WatchHistoryService(IWatchHistoryRepository watchHistoryRepository, IAccountRepository accountRepository, IMovieRepository movieRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _watchHistoryRepository = watchHistoryRepository;
            _accountRepository = accountRepository;
            _movieRepository = movieRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> AddWatchHistoryFromAPIAsync(string email, int movieId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var watchHistory = new WatchHistory
            {
                UserId = account.Id,
                MovieId = movieId,
                WatchedAt = DateTime.Now,
                Progress = 0,
            };

            _watchHistoryRepository.AddWatchHistoryAsync(watchHistory);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den WatchHistory
            await _responseCache.DeleteKeyInRedis("WatchHistory");
            return Result.Ok(true);
        }

        public async Task<Result<WatchHistory>> CheckUserWatchHistoryFromAPIAsync(string email, int movieId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<WatchHistory>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<WatchHistory>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = await _watchHistoryRepository.CheckUserWatchHistoryAsync(account.Id, movieId);
            if (result == null)
            {
                return Result.Fail<WatchHistory>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<bool>> ContinueWatchHistoryFromAPIAsync(string email, int movieId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            //Tim ra lan cuoi xem phim
            var lastWatch = await _watchHistoryRepository.UserLastWatchHistoryAsync(account.Id, movieId);

            var watchHistory = new WatchHistory
            {
                UserId = account.Id,
                MovieId = movieId,
                WatchedAt = DateTime.Now,
                Progress = (lastWatch != null && lastWatch.Progress < (movie.Duration * 60)) ? lastWatch.Progress : 0
            };

            var shouldAddNewView = lastWatch?.WatchedAt == null || (DateTime.Now - lastWatch.WatchedAt.Value).TotalSeconds > 30;
            if (shouldAddNewView)
            {
                _watchHistoryRepository.AddWatchHistoryAsync(watchHistory);
                await _unitOfWork.SaveChangesAsync();

                //Xoa key lien quan den WatchHistory
                await _responseCache.DeleteKeyInRedis("WatchHistory");
            }
            return Result.Ok(true);
        }

        public async Task<Result<bool>> RemoveWatchHistoryFromAPIAsync(int historyId)
        {
            var result = await _watchHistoryRepository.ViewWatchHistoryByIdAsync(historyId);
            if (result == null)
            {
                return Result.Fail<bool>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            _watchHistoryRepository.RemoveWatchHistoryAsync(result);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("WatchHistory");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> UpdateWatchHistoryFromAPIAsync(string email, int movieId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = await _watchHistoryRepository.UserLastWatchHistoryAsync(account.Id, movieId);
            if (result == null)
            {
                return Result.Fail<bool>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }

            //Cap nhat thoi gian xem phim tuong doi
            int temp = result.Progress;
            var progress = (int)Math.Floor((DateTime.Now - result.WatchedAt.Value).TotalSeconds) + temp - 30;
            result.Progress = Math.Max(progress, 0);

            _watchHistoryRepository.UpdateWatchHistoryAsync(result);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den WatchHistory
            await _responseCache.DeleteKeyInRedis("WatchHistory");
            return Result.Ok(true);
        }

        public async Task<Result<WatchHistory>> UserLastWatchHistoryFromAPIAsync(string email, int movieId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<WatchHistory>(new Error($"Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<WatchHistory>(new Error($"Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = await _watchHistoryRepository.UserLastWatchHistoryAsync(account.Id, movieId);
            if (result == null)
            {
                return Result.Fail<WatchHistory>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<WatchHistory>>> ViewAllUserWatchHistoryFromAPIAsync()
        {
            var result = await _watchHistoryRepository.ViewAllUserWatchHistoryAsync();
            if (result == null)
            {
                return Result.Fail<List<WatchHistory>>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<int>> ViewAllWatchHistoryTodayFromAPIAsync(string search)
        {
            var historyList = await _watchHistoryRepository.ViewAllUserWatchHistoryAsync();
            if (historyList.Count == 0)
            {
                return Result.Ok(0);
            }

            if (search.ToLower() == "today")
            {
                var result = historyList.Where(history => history.WatchedAt.Value.Date == System.DateTime.Now.Date).ToList();
                if (result == null)
                {
                    return Result.Ok(0);
                }
                return Result.Ok(result.Count());
            }
            else if (search.ToLower() == "month")
            {
                var result = historyList.Where(history => history.WatchedAt.Value.Month == System.DateTime.Now.Month).ToList();
                if (result == null)
                {
                    return Result.Ok(0);
                }
                return Result.Ok(result.Count());
            }
            return Result.Ok(0);
        }

        public async Task<Result<List<Movie>>> ViewMovieDetailsInWatchHistory(string email, int pageSize, string id)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Movie>>(new Error($"Account not found").WithMetadata("StatusCode", 404));
            }

            var watchHistories = await _watchHistoryRepository.ViewUserWatchHistoryByUserIdAsync(account.Id, pageSize, id);
            if (watchHistories.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }

            var listMovies = new List<Movie>();
            for (int i = 0; i <= watchHistories.Count - 1; i++)
            {
                var result = listMovies.Select(movie => movie.MovieId).ToList();
                if (result.Contains(watchHistories[i].MovieId) == false)
                {
                    var movie = await _movieRepository.ViewMovieHistoryByIdAsync(watchHistories[i].MovieId);
                    if (movie == null)
                    {
                        return Result.Fail<List<Movie>>(new Error($"Movie not found - MovieId:{watchHistories[i].MovieId}").WithMetadata("StatusCode", 404));
                    }
                    listMovies.Add(movie);
                }
            }
            return Result.Ok(listMovies);
        }

        public async Task<Result<List<WatchHistory>>> ViewUserWatchHistoryByEmailFromAPIAsync(string email, int pageSize, string historyId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<WatchHistory>>(new Error($"Account not found").WithMetadata("StatusCode", 404));
            }

            var list = await _watchHistoryRepository.ViewUserWatchHistoryByUserIdAsync(account.Id, pageSize, historyId);
            if (list == null)
            {
                return Result.Fail<List<WatchHistory>>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(list);
        }

        public async Task<Result<WatchHistory>> ViewWatchHistoryByIdFromAPIAsync(int historyId)
        {
            var result = await _watchHistoryRepository.ViewWatchHistoryByIdAsync(historyId);
            if (result == null)
            {
                return Result.Fail<WatchHistory>(new Error("WatchHistory not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
