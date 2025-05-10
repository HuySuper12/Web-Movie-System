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
    public class NotificationRepository : INotificationRepository
    {
        private readonly CinemaHubContext _context;

        public NotificationRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void AddNotificationAsync(Notification notification)
        {
            _context.Notifications.Add(notification);
        }

        public async Task<int> CountUserNotificationUnReadAsync(string userId)
        {
            return await _context.Notifications.Where(noti => noti.ReceiverId == userId && noti.Status == false).CountAsync();
        }

        public void RemoveNotificationAsync(Notification notification)
        {
            _context.Notifications.Remove(notification);
        }

        public void UpdateNotificationAsync(Notification notification)
        {
            _context.Notifications.Update(notification);
        }

        public async Task<List<Notification>> ViewAllUserNotificationAsync(int pageSize, string notificationId)
        {
            var query = _context.Notifications.AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(notificationId))
            {
                query = query.Where(n => n.NotificationId < int.Parse(notificationId)).OrderByDescending(n => n.NotificationId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<Notification> ViewNotificationByIdAsync(int notificationId)
        {
            return await _context.Notifications.AsNoTracking().FirstOrDefaultAsync(noti => noti.NotificationId == notificationId);
        }

        public async Task<List<Notification>> ViewStaffNotificationAsync(string staffId, int pageSize, string notificationId)
        {
            var query = _context.Notifications.Where(noti => noti.UserId == staffId).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(notificationId))
            {
                query = query.Where(n => n.NotificationId < int.Parse(notificationId)).OrderByDescending(n => n.NotificationId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<List<Notification>> ViewUserNotificationAsync(string userId, int pageSize, string notificationId)
        {
            var query = _context.Notifications.Where(noti => noti.ReceiverId == userId).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(notificationId))
            {
                query = query.Where(n => n.NotificationId < int.Parse(notificationId)).OrderByDescending(n => n.NotificationId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<List<Notification>> ViewUserNotificationUnReadAsync(string userId, int pageSize, string notificationId)
        {
            var query = _context.Notifications.Where(noti => noti.ReceiverId == userId && noti.Status == false).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(notificationId))
            {
                query = query.Where(n => n.NotificationId < int.Parse(notificationId)).OrderByDescending(n => n.NotificationId);
            }

            return await query.Take(pageSize).ToListAsync();
        }
    }
}
