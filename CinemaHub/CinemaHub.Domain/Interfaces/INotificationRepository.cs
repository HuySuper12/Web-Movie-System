using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface INotificationRepository
    {
        void AddNotificationAsync(Notification notification);
        void UpdateNotificationAsync(Notification notification);
        void RemoveNotificationAsync(Notification notification);

        Task<List<Notification>> ViewStaffNotificationAsync(string staffId, int pageSize, string notificationId);
        Task<List<Notification>> ViewUserNotificationAsync(string userId, int pageSize, string notificationId);
        Task<List<Notification>> ViewUserNotificationUnReadAsync(string userId, int pageSize, string notificationId);
        Task<int> CountUserNotificationUnReadAsync(string userId);
        Task<List<Notification>> ViewAllUserNotificationAsync(int pageSize, string notificationId);
        Task<Notification> ViewNotificationByIdAsync(int notificationId);
    }
}
