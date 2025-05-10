using CinemaHub.Application.Commands.Notifications;
using CinemaHub.Application.Events;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.Notifications
{
    public class AddNotificationViolationSecondCommandHandler : IRequestHandler<AddNotificationViolationSecondCommand, Result<bool>>
    {
        private readonly INotificationService _notificationService;
        private readonly IMediator _mediator;

        public AddNotificationViolationSecondCommandHandler(INotificationService notificationService, IMediator mediator)
        {
            _notificationService = notificationService;
            _mediator = mediator;
        }

        public async Task<Result<bool>> Handle(AddNotificationViolationSecondCommand request, CancellationToken cancellationToken)
        {
            var result = await _notificationService.AddNotificationViolationSecond(request.ViolationRequest);
            if (result.Value == true)
            {
                await _mediator.Publish(new NotificationViolationSecondEvent(request.ViolationRequest));
            }
            return result;
        }
    }
}
