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
    public class ViewUserNotificationUnReadQueryHandler : IRequestHandler<ViewUserNotificationUnReadQuery, Result<List<Notification>>>
    {
        private readonly INotificationService _notificationService;

        public ViewUserNotificationUnReadQueryHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<List<Notification>>> Handle(ViewUserNotificationUnReadQuery request, CancellationToken cancellationToken)
        {
            return await _notificationService.ViewUserNotificationUnReadFromAPIAsync(request.Email, request.PageSize, request.NotificationId);
        }
    }
}
