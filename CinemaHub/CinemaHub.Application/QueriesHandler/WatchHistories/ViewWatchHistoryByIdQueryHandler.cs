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
    public class ViewWatchHistoryByIdQueryHandler : IRequestHandler<ViewWatchHistoryByIdQuery, Result<WatchHistory>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public ViewWatchHistoryByIdQueryHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }
        public async Task<Result<WatchHistory>> Handle(ViewWatchHistoryByIdQuery request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.ViewWatchHistoryByIdFromAPIAsync(request.HistoryId);
        }
    }
}
