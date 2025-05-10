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
    public class ViewAllUserNotificationQuery : IRequest<Result<List<Notification>>>
    {
        public int PageSize { get; set; }
        public string NotificationId { get; set; }

        public ViewAllUserNotificationQuery(int pageSize, string notificationId)
        {
            PageSize = pageSize;
            NotificationId = notificationId;
        }
    }
}
