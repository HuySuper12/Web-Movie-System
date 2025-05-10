using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Account : IdentityUser
    {
        //public int UserId { get; set; }

        public string FullName { get; set; } = null!;

        //public string Email { get; set; } = null!;

        //public string PasswordHash { get; set; } = null!;

        public string? ProfilePicture { get; set; }

        //public string Role { get; set; } = null!;

        //public string? Permissions { get; set; }

        public decimal? Balance { get; set; }

        public DateTime? CreatedAt { get; set; }

        public bool? Status { get; set; }
        public string? OtpCode { get; set; }
        public DateTime? OtpExpiration { get; set; }

        public int? ViolationCount { get; set; }

        public DateTime? AccountLockUntil { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

        public virtual ICollection<Log> Logs { get; set; } = new List<Log>();

        public virtual ICollection<Movie> Movies { get; set; } = new List<Movie>();

        public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

        public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();

        public virtual ICollection<UserFavorite> UserFavorites { get; set; } = new List<UserFavorite>();

        public virtual ICollection<WatchHistory> WatchHistories { get; set; } = new List<WatchHistory>();

        public virtual ICollection<UserRefreshToken> RefreshTokens { get; set; } = new List<UserRefreshToken>();
    }
}
