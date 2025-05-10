using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IWatchHistoryService
    {
        Task<Result<bool>> AddWatchHistoryFromAPIAsync(string email, int movieId);
        Task<Result<bool>> ContinueWatchHistoryFromAPIAsync(string email, int movieId);
        Task<Result<bool>> UpdateWatchHistoryFromAPIAsync(string email, int movieId);
        Task<Result<bool>> RemoveWatchHistoryFromAPIAsync(int historyId);
        Task<Result<WatchHistory>> CheckUserWatchHistoryFromAPIAsync(string email, int movieId);
        Task<Result<WatchHistory>> UserLastWatchHistoryFromAPIAsync(string email, int movieId);
        Task<Result<WatchHistory>> ViewWatchHistoryByIdFromAPIAsync(int historyId);
        Task<Result<List<WatchHistory>>> ViewAllUserWatchHistoryFromAPIAsync();
        Task<Result<List<WatchHistory>>> ViewUserWatchHistoryByEmailFromAPIAsync(string email, int pageSize, string historyId);
        Task<Result<List<Movie>>> ViewMovieDetailsInWatchHistory(string email, int pageSize, string id);
        Task<Result<int>> ViewAllWatchHistoryTodayFromAPIAsync(string search);
    }
}
