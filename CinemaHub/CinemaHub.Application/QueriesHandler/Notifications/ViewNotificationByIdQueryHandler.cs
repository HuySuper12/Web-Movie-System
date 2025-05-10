using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Notifications;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Notifications
{
    public class ViewNotificationByIdQueryHandler : IRequestHandler<ViewNotificationByIdQuery, Result<Notification>>
    {
        private readonly INotificationService _notificationService;

        public ViewNotificationByIdQueryHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<Notification>> Handle(ViewNotificationByIdQuery request, CancellationToken cancellationToken)
        {
            return await _notificationService.ViewNotificationByIdFromAPIAsync(request.NotificationId);
        }
    }
}
