using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Response
{
    public class AccountResponse
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string FullName { get; set; }
        public string ProfilePicture { get; set; }
        public decimal? Balance { get; set; }

        public DateTime? CreatedAt { get; set; }

        public bool? Status { get; set; }
        public string? OtpCode { get; set; }
        public DateTime? OtpExpiration { get; set; }

        public int? ViolationCount { get; set; }

        public DateTime? AccountLockUntil { get; set; }
    }
}
