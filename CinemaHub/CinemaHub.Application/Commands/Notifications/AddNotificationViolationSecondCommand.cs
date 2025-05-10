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
    public class AddNotificationViolationSecondCommand : IRequest<Result<bool>>
    {
        public NotificationViolationRequest ViolationRequest { get; set; }

        public AddNotificationViolationSecondCommand(NotificationViolationRequest violationRequest)
        {
            ViolationRequest = violationRequest;
        }
    }
}
