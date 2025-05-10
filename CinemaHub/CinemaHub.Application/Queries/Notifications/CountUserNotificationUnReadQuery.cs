using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Notifications
{
    public class CountUserNotificationUnReadQuery : IRequest<Result<int>>
    {
        public string Email { get; set; }
        public CountUserNotificationUnReadQuery(string email) 
        {
            Email = email;
        }
    }
}
