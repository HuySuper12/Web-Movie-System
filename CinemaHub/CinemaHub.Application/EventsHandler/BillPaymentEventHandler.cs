using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.Internal;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.EventsHandler
{
    public class BillPaymentEventHandler : INotificationHandler<BillPaymentEvent>
    {
        private readonly IJobService _jobService;

        public BillPaymentEventHandler(IJobService jobService)
        {
            _jobService = jobService;
        }

        public async Task Handle(BillPaymentEvent notification, CancellationToken cancellationToken)
        {
            await _jobService.EnqueueSendEmailAfterPayment(notification.Payment);
        }
    }
}
