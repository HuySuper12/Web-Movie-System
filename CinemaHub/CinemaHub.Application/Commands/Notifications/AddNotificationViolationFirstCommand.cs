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
    public class AddNotificationViolationFirstCommand : IRequest<Result<bool>>
    {
        public NotificationViolationRequest ViolationRequest { get; set; }

        public AddNotificationViolationFirstCommand(NotificationViolationRequest violationRequest)
        {
            ViolationRequest = violationRequest;
        }
    }
}
