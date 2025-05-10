using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.External
{
    public interface INotificationForm
    {
        string RegularNotificationForm(string userName, string staffName, string title, string content);

        string NotificationAfterCreateMovieForm(string userName, string staffName, string movieTitle);

        string NotificationViolationFirst(string userName, string title, string content);
    }
}
