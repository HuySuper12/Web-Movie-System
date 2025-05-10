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
    public class AddNotificationCommandHandler : IRequestHandler<AddNotificationCommand, Result<bool>>
    {
        private readonly INotificationService _notificationService;
        public AddNotificationCommandHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<bool>> Handle(AddNotificationCommand request, CancellationToken cancellationToken)
        {
            return await _notificationService.AddNotificationFromAPIAsync(request.NotificationRequest);
        }
    }
}
