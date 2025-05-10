using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class WatchHistoryRepository : IWatchHistoryRepository
    {
        private readonly CinemaHubContext _context;

        public WatchHistoryRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void AddWatchHistoryAsync(WatchHistory watchHistory)
        {
            _context.WatchHistories.Add(watchHistory);
        }

        public async Task<WatchHistory> CheckUserWatchHistoryAsync(string userId, int movieId)
        {
            return await _context.WatchHistories.Where(u => u.UserId == userId && u.MovieId == movieId).OrderByDescending(p => p.HistoryId).AsNoTracking().FirstOrDefaultAsync();
        }

        public Dictionary<string, decimal> GetTotalViewStatistics()
        {
            var statistics = _context.WatchHistories
            .Where(watchHistory => watchHistory.WatchedAt.HasValue)
            .GroupBy(watchHistory => new { Year = watchHistory.WatchedAt.Value.Year, Month = watchHistory.WatchedAt.Value.Month })
            .ToDictionary(
                g => $"{g.Key.Year}-{g.Key.Month}",  // Key: Năm và tháng
                g => (decimal)g.Count()              // Value: Luot xem theo thang
            );
            return statistics;
        }

        public void RemoveWatchHistoryAsync(WatchHistory watchHistory)
        {
            _context.WatchHistories.Remove(watchHistory);
        }

        public void UpdateWatchHistoryAsync(WatchHistory watchHistory)
        {
            _context.WatchHistories.Update(watchHistory);
        }

        public async Task<WatchHistory> UserLastWatchHistoryAsync(string userId, int movieId)
        {
            return await _context.WatchHistories.OrderBy(w => w.HistoryId).LastOrDefaultAsync(u => u.UserId == userId && u.MovieId == movieId);
        }

        public async Task<List<WatchHistory>> ViewAllUserWatchHistoryAsync()
        {
            return await _context.WatchHistories.AsNoTracking().ToListAsync();
        }

        public async Task<List<WatchHistory>> ViewUserWatchHistoryByUserIdAsync(string userId, int pageSize, string historyId)
        {
            var query = _context.WatchHistories
    .Where(w => w.UserId == userId &&
                w.WatchedAt == _context.WatchHistories
                    .Where(inner => inner.MovieId == w.MovieId)
                    .Max(inner => inner.WatchedAt)).AsNoTracking().AsQueryable(); // Lấy bản ghi mới nhất cho mỗi MovieId
            if (!string.IsNullOrEmpty(historyId))
            {
                query = query.Where(h => h.HistoryId < int.Parse(historyId)).OrderByDescending(h => h.WatchedAt);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<WatchHistory> ViewWatchHistoryByIdAsync(int historyId)
        {
            return await _context.WatchHistories.AsNoTracking().FirstOrDefaultAsync(u => u.HistoryId == historyId);
        }
    }
}
