using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Request
{
    public class MovieRequest
    {
        public string? Id { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(200, ErrorMessage = "Title cannot be longer than 200 characters.")]
        public string Title { get; set; }

        [Required(ErrorMessage = "Description is required.")]
        public string? Description { get; set; }

        [Required(ErrorMessage = "Release Date is required.")]
        public DateOnly? ReleaseDate { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Duration must be a positive number.")]
        public int Duration { get; set; }

        [StringLength(50, ErrorMessage = "Language cannot be longer than 50 characters.")]
        public string? Language { get; set; }

        [Required]
        public string? TrailerUrl { get; set; }

        [Required]
        public string? VideoUrl { get; set; }

        [Required]
        public string? Thumbnail { get; set; }

        [StringLength(100, ErrorMessage = "Director name cannot be longer than 100 characters.")]
        public string? Director { get; set; }

        [Required(ErrorMessage = "Staff Email is required.")]
        [EmailAddress(ErrorMessage = "Email address is not valid.")]
        public string EmailStaff { get; set; }

        public List<string> GerneName { get; set; }
    }
}
