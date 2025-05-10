using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Events
{
    public class NotificationNewMovieEvent : INotification
    {
        public int MovieId { get; set; }
        public NotificationNewMovieEvent(int movieId)
        {
            MovieId = movieId;
        }
    }
}
