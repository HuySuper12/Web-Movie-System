using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public class UserRefreshToken
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public string Token { get; set; }

        [Required]
        public string UserId { get; set; }

        public Account User { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime ExpiresAt { get; set; }
        public bool Revoked { get; set; } = false;
    }
}
