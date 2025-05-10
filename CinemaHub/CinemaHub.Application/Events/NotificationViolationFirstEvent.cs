using CinemaHub.Application.DTOs.Request;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Events
{
    public class NotificationViolationFirstEvent : INotification
    {
        public NotificationViolationRequest ViolationRequest { get; set; }

        public NotificationViolationFirstEvent(NotificationViolationRequest violationRequest)
        {
            ViolationRequest = violationRequest;
        }
    }
}
