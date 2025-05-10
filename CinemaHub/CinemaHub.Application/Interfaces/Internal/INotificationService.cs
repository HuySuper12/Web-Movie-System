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
    public interface INotificationService
    {
        Task<Result<bool>> AddNotificationFromAPIAsync(NotificationRequest notificationRequest);
        Task<Result<bool>> UpdateNotificationFromAPIAsync(int notificationId);
        Task<Result<bool>> RemoveNotificationFromAPIAsync(int notificationId);
        Task<Result<bool>> AddNotificationViolationFirst(NotificationViolationRequest violationRequest);
        Task<Result<bool>> AddNotificationViolationSecond(NotificationViolationRequest violationRequest);

        Task<Result<List<Notification>>> ViewStaffNotificationFromAPIAsync(string email, int pageSize, string notificationId);
        Task<Result<List<Notification>>> ViewUserNotificationFromAPIAsync(string email, int pageSize, string notificationId);
        Task<Result<List<Notification>>> ViewUserNotificationUnReadFromAPIAsync(string email, int pageSize, string notificationId);
        Task<Result<List<Notification>>> ViewAllUserNotificationFromAPIAsync(int pageSize, string notificationId);
        Task<Result<int>> CountUserNotificationUnReadFromAPIAsync(string email);
        Task<Result<Notification>> ViewNotificationByIdFromAPIAsync(int notificationId);
    }
}
