using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class NotificationModel
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
