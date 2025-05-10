using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Payments.VNPay
{
    public interface IVNPAYService
    {
        Task<string> CreateVNPAYURL(PaymentInformation paymentInfo);
        Task<bool> VnPayIpnUrl(Dictionary<string, string> queryParams);
        Task<Domain.Entities.Payment> ReturnURL(Dictionary<string, string> queryParams);
    }
}
