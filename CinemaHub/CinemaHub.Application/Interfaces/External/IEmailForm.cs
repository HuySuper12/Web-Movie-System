using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.External
{
    public interface IEmailForm
    {
        EmailResponse OtpForm(Account user, string otp);

        EmailResponse PaymentForm(string fullName, string subscriptionPlanName, Payment payment);

        EmailResponse ViolationSecondForm(string fullName, string content);
    }
}
