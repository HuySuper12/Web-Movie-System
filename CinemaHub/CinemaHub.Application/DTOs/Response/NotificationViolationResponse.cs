using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Response
{
    public class NotificationViolationResponse
    {
        public Account StaffAccount { get; set; }
        public Account UserAccount { get; set; }
        public Comment CommentDetail { get; set; }
    }
}
