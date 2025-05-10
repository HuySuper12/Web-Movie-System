using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Notifications
{
    public class RemoveNotificationCommand : IRequest<Result<bool>>
    {
        public int NotificationId { get; set; }
        public RemoveNotificationCommand(int notificationId)
        {
            NotificationId = notificationId;
        }
    }
}
