namespace CinemaHub.API.Models
{
    public class PaymentInformationModel
    {
        public string UserEmail { get; set; } = null!;
        public int SubscriptionPlanId { get; set; }
        public decimal Amount { get; set; }
        public int ExpiryDate { get; set; }
    }
}
