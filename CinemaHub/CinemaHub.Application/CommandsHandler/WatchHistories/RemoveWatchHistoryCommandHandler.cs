using CinemaHub.Application.Commands.WatchHistories;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.WatchHistories
{
    public class RemoveWatchHistoryCommandHandler : IRequestHandler<RemoveWatchHistoryCommand, Result<bool>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public RemoveWatchHistoryCommandHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }

        public async Task<Result<bool>> Handle(RemoveWatchHistoryCommand request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.RemoveWatchHistoryFromAPIAsync(request.HistoryId);
        }
    }
}
