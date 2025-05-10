using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Request
{
    public class NotificationRequest
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid Email Address format.")]
        public string StaffEmail { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        public string ReceiverEmail { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        public string Title { get; set; } = null!;

        [Required(ErrorMessage = "Content is required.")]
        public string Content { get; set; } = null!;
    }
}
