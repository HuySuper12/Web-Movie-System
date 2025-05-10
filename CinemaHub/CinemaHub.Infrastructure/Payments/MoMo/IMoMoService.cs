using CinemaHub.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.MoMo
{
    public interface IMoMoService
    {
        Task<string> CreateMoMoURL(PaymentInformation paymentInfo);
        Task<bool> MoMoIpnUrl(Dictionary<string, string> queryParams);
        Task<Payment> MoMoReturnUrl(Dictionary<string, string> queryParams);
    }
}
