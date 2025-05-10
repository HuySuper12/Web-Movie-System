using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.WatchHistories;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.WatchHistories
{
    public class ViewUserWatchHistoryByEmailQueryHandler : IRequestHandler<ViewUserWatchHistoryByEmailQuery, Result<List<WatchHistory>>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public ViewUserWatchHistoryByEmailQueryHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }
        public async Task<Result<List<WatchHistory>>> Handle(ViewUserWatchHistoryByEmailQuery request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.ViewUserWatchHistoryByEmailFromAPIAsync(request.Email, request.PageSize, request.HistoryId);
        }
    }
}
