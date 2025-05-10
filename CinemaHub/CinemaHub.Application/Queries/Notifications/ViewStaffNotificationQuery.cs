using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Notifications
{
    public class ViewStaffNotificationQuery : IRequest<Result<List<Notification>>>
    {
        public string Email { get; set; } 
        public int PageSize { get; set; }
        public string NotificationId { get; set; }

        public ViewStaffNotificationQuery(string email, int pageSize, string notificationId)
        {
            Email = email;
            PageSize = pageSize;
            NotificationId = notificationId;
        }
    }
}
