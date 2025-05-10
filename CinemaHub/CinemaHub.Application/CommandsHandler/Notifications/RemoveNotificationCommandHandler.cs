using CinemaHub.Application.Commands.Notifications;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Notifications
{
    public class RemoveNotificationCommandHandler : IRequestHandler<RemoveNotificationCommand, Result<bool>>
    {
        private readonly INotificationService _notificationService;

        public RemoveNotificationCommandHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<bool>> Handle(RemoveNotificationCommand request, CancellationToken cancellationToken)
        {
            return await _notificationService.RemoveNotificationFromAPIAsync(request.NotificationId);
        }
    }
}
