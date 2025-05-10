using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class WishlistModel
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid Email Address format.")]
        public string Email { get; set; }

        [Required]
        public int MovieId { get; set; }
    }
}
