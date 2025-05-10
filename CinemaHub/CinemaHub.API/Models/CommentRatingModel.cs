using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class CommentRatingModel
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid Email Address format.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "MovieId is required.")]
        [Range(1, int.MaxValue, ErrorMessage = "MovieId must be a positive number.")]
        public int MovieId { get; set; }

        public string Content { get; set; } = null!;

        public double Rating1 { get; set; }
    }
}
