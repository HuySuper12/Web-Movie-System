using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.WatchHistories;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.WatchHistories
{
    public class ViewAllWatchHistoryTodayQueryHandler : IRequestHandler<ViewAllWatchHistoryTodayQuery, Result<int>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public ViewAllWatchHistoryTodayQueryHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }

        public async Task<Result<int>> Handle(ViewAllWatchHistoryTodayQuery request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.ViewAllWatchHistoryTodayFromAPIAsync(request.Search);
        }
    }
}
