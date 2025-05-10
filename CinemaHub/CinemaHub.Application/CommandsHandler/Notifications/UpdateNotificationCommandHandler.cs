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
    public class UpdateNotificationCommandHandler : IRequestHandler<UpdateNotificationCommand, Result<bool>>
    {
        private readonly INotificationService _notificationService;

        public UpdateNotificationCommandHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<bool>> Handle(UpdateNotificationCommand request, CancellationToken cancellationToken)
        {
            return await _notificationService.UpdateNotificationFromAPIAsync(request.NotificationId);
        }
    }
}
