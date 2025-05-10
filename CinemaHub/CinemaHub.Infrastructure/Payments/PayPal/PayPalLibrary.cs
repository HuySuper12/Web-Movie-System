using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Nodes;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.PayPal
{
    public class PayPals
    {
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string PayPalUrl { get; set; }
        public string URLSuccess { get; set; }
        public string URLFail { get; set; }
    }

    public class PayPalLibrary
    {
        private PayPals _payPals;

        public PayPalLibrary(IOptionsMonitor<PayPals> paypals)
        {
            _payPals = paypals.CurrentValue;
        }

        private async Task<string> GetPaypalAccessToken()
        {
            string paypalUrl = _payPals.PayPalUrl;
            string paypalClientID = _payPals.ClientId;
            string paypalClientSecret = _payPals.ClientSecret;
            string paypalAccessToken = "";

            string url = _payPals.PayPalUrl + "/v1/oauth2/token";

            using (var client = new HttpClient())
            {
                string credimentals = Convert.ToBase64String(Encoding.UTF8.GetBytes(paypalClientID + ":" + paypalClientSecret));

                client.DefaultRequestHeaders.Add("Authorization", "Basic " + credimentals);

                var requestMessage = new HttpRequestMessage(HttpMethod.Post, url);
                requestMessage.Content = new StringContent("grant_type=client_credentials", Encoding.UTF8, "application/x-www-form-urlencoded");

                var response = await client.SendAsync(requestMessage);

                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var jObject = JsonNode.Parse(responseContent);
                    if (jObject != null)
                    {
                        paypalAccessToken = jObject["access_token"]?.ToString() ?? "";
                    }
                }
            }
            return paypalAccessToken;
        }
    }
}
