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
    public class ViewMovieDetailsInWatchHistoryQueryHandler : IRequestHandler<ViewMovieDetailsInWatchHistoryQuery, Result<List<Movie>>>
    {
        private readonly IWatchHistoryService _watchHistoryService;

        public ViewMovieDetailsInWatchHistoryQueryHandler(IWatchHistoryService watchHistoryService)
        {
            _watchHistoryService = watchHistoryService;
        }

        public async Task<Result<List<Movie>>> Handle(ViewMovieDetailsInWatchHistoryQuery request, CancellationToken cancellationToken)
        {
            return await _watchHistoryService.ViewMovieDetailsInWatchHistory(request.Email, request.PageSize, request.HistoryId);
        }
    }
}
