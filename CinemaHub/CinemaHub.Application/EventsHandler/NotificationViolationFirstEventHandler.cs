using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.Internal;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.EventsHandler
{
    public class NotificationViolationFirstEventHandler : INotificationHandler<NotificationViolationFirstEvent>
    {
        private readonly IJobService _jobService;

        public NotificationViolationFirstEventHandler(IJobService jobService)
        {
            _jobService = jobService;
        }

        public async Task Handle(NotificationViolationFirstEvent notification, CancellationToken cancellationToken)
        {
            var result = await _jobService.SearchViolationInfomation(notification.ViolationRequest);
            await _jobService.EnqueueSendNotificationViolationFirst(result.StaffAccount, result.UserAccount, result.CommentDetail);
        }
    }
}
