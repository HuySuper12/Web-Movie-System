using CinemaHub.Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Events
{
    public class BillPaymentEvent : INotification
    {
        public Payment Payment { get; set; }

        public BillPaymentEvent(Payment payment)
        {
            Payment = payment;
        }
    }
}
