using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.Notifications;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.Notifications
{
    public class CountUserNotificationUnReadQueryHandler : IRequestHandler<CountUserNotificationUnReadQuery, Result<int>>
    {
        private readonly INotificationService _notificationService;
        public CountUserNotificationUnReadQueryHandler(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        public async Task<Result<int>> Handle(CountUserNotificationUnReadQuery request, CancellationToken cancellationToken)
        {
            return await _notificationService.CountUserNotificationUnReadFromAPIAsync(request.Email);
        }
    }
}
