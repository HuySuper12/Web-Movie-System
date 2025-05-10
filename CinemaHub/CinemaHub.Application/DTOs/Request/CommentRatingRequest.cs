using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Request
{
    public class CommentRatingRequest
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
