using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class SubscriptionPlan
    {
        public int PlanId { get; set; }

        public string PlanName { get; set; } = null!;

        public string? Description { get; set; }

        public decimal Price { get; set; }

        public int Duration { get; set; }

        public DateTime? CreatedAt { get; set; }

        public bool? IsActive { get; set; }

        [JsonIgnore]
        public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
    }
}
