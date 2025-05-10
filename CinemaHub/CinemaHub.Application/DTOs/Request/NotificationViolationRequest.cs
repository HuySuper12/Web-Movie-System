using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Request
{
    public class NotificationViolationRequest
    {
        public string StaffEmail { get; set; }
        public string UserId { get; set; }
        public int CommentId { get; set; }
    }
}
