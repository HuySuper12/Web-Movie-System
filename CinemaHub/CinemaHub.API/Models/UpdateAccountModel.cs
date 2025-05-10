using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class UpdateAccountModel
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid Email Address format.")]
        public string Email { get; set; } = null!;

        [Required]
        public string FullName { get; set; } = null!;

        [Required]
        public string PhoneNumber { get; set; } = null!;

        [Required]
        public string PictureUrl { get; set; } = null!;
    }
}
