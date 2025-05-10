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
    public class ViewNotificationByIdQuery : IRequest<Result<Notification>>
    {
        public int NotificationId { get; set; }

        public ViewNotificationByIdQuery(int notificationId)
        {
            NotificationId = notificationId;
        }
    }
}
