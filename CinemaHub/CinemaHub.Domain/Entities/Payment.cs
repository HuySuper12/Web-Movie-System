using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Payment
    {
        public int PaymentId { get; set; }

        public string PaymentCode { get; set; } = null!;

        public string UserId { get; set; } = null!;

        public int SubscriptionPlanId { get; set; }

        public DateTime? PaymentDate { get; set; }

        public decimal Amount { get; set; }

        public string PaymentMethod { get; set; } = null!;

        public string PaymentStatus { get; set; } = null!;

        public DateTime ExpiryDate { get; set; }

        public virtual SubscriptionPlan SubscriptionPlan { get; set; } = null!;

        public virtual Account User { get; set; } = null!;
    }
}
