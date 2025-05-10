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
    public class NotificationNewMovieEventHandler : INotificationHandler<NotificationNewMovieEvent>
    {
        private readonly IJobService _jobService;

        public NotificationNewMovieEventHandler(IJobService jobService)
        {
            _jobService = jobService;
        }

        public async Task Handle(NotificationNewMovieEvent notificationNewMovieEvent, CancellationToken cancellationToken)
        {
            await _jobService.EnqueueSendNotificationAfterCreateMovieFromAPIAsync(notificationNewMovieEvent.MovieId);
        }
    }
}
