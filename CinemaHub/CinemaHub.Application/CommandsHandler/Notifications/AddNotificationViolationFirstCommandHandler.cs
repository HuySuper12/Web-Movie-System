using CinemaHub.Application.Commands.Notifications;
using CinemaHub.Application.DTOs.Request;
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
    public class AddNotificationViolationFirstCommandHandler : IRequestHandler<AddNotificationViolationFirstCommand, Result<bool>>
    {
        private readonly INotificationService _notificationService;
        private readonly IMediator _mediator;

        public AddNotificationViolationFirstCommandHandler(INotificationService notificationService, IMediator mediator)
        {
            _notificationService = notificationService;
            _mediator = mediator;
        }

        public async Task<Result<bool>> Handle(AddNotificationViolationFirstCommand request, CancellationToken cancellationToken)
        {
            var result = await _notificationService.AddNotificationViolationFirst(request.ViolationRequest);
            if(result.Value == true)
            {
                await _mediator.Publish(new NotificationViolationFirstEvent(request.ViolationRequest));
            }
            return result;
        }
    }
}
