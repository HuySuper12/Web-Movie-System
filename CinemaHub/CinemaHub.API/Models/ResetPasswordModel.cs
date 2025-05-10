using System.ComponentModel.DataAnnotations;

namespace CinemaHub.API.Models
{
    public class ResetPasswordModel
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid Email Address format.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,}$",
    ErrorMessage = "Password must be at least 8 characters long and contain uppercase, lowercase, digit and special character.")]
        public string Password { get; set; }
    }
}
