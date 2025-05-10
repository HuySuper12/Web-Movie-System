using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Notifications
{
    public class UpdateNotificationCommand : IRequest<Result<bool>>
    {
        public int NotificationId { get; set; }
        public UpdateNotificationCommand(int notificationId)
        {
            NotificationId = notificationId;
        }
    }
}
