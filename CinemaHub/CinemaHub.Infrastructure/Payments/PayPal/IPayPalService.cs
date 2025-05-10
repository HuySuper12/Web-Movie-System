using CinemaHub.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.PayPal
{
    public interface IPayPalService
    {
        Task<string> CreatePayment(PaymentInformation paymentInformation);
        Task<Domain.Entities.Payment> SuccessPayment(string paymentCode);
        Task<bool> FailPayment(string paymentCode);
    }
}
