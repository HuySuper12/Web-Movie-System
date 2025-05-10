using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class SubscriptionPlanModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Plan Name is required.")]
        [StringLength(100, ErrorMessage = "Plan Name cannot exceed 100 characters.")]
        public string PlanName { get; set; } = null!;
        public string? Description { get; set; }

        [Required(ErrorMessage = "Price is required.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Price must be greater than zero.")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Duration is required.")]
        [Range(1, int.MaxValue, ErrorMessage = "Duration must be a positive number.")]
        public int Duration { get; set; }
    }
}
