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
    public class AddWatchHistoryCommandHandler : IRequestHandler<AddWatchHistoryCommand, Result<bool>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public AddWatchHistoryCommandHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }

        public async Task<Result<bool>> Handle(AddWatchHistoryCommand request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.AddWatchHistoryFromAPIAsync(request.Email, request.MovieId);
        }
    }
}
