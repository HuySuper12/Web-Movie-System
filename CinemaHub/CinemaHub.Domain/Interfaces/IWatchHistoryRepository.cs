using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IWatchHistoryRepository
    {
        void AddWatchHistoryAsync(WatchHistory watchHistory);
        void UpdateWatchHistoryAsync(WatchHistory watchHistory);
        void RemoveWatchHistoryAsync(WatchHistory watchHistory);
        Task<WatchHistory> CheckUserWatchHistoryAsync(string userId, int movieId);
        Task<WatchHistory> UserLastWatchHistoryAsync(string userId, int movieId);
        Task<WatchHistory> ViewWatchHistoryByIdAsync(int historyId);
        Task<List<WatchHistory>> ViewAllUserWatchHistoryAsync();
        Task<List<WatchHistory>> ViewUserWatchHistoryByUserIdAsync(string userId, int pageSize, string historyId);

        Dictionary<string, decimal> GetTotalViewStatistics();
    }
}
