using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments
{
    public class PaymentInformation
    {
        public string UserEmail { get; set; } = null!;
        public int SubscriptionPlanId { get; set; }
        public decimal Amount { get; set; }
        public int ExpiryDate { get; set; }
    }
}
