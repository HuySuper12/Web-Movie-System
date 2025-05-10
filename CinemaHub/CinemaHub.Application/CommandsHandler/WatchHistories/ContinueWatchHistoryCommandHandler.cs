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
    public class ContinueWatchHistoryCommandHandler : IRequestHandler<ContinueWatchHistoryCommand, Result<bool>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public ContinueWatchHistoryCommandHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }

        public async Task<Result<bool>> Handle(ContinueWatchHistoryCommand request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.ContinueWatchHistoryFromAPIAsync(request.Email, request.MovieId);
        }
    }
}
