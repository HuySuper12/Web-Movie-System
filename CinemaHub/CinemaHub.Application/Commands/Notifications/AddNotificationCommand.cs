using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Notifications
{
    public class AddNotificationCommand : IRequest<Result<bool>>
    {
        public NotificationRequest NotificationRequest { get; set; }

        public AddNotificationCommand(NotificationRequest notificationRequest)
        {
            NotificationRequest = notificationRequest;
        }
    }
}
