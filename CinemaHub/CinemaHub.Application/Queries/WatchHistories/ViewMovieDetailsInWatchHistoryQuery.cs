using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.WatchHistories
{
    public class ViewMovieDetailsInWatchHistoryQuery : IRequest<Result<List<Movie>>>
    {
        public string Email { get; set; }
        public int PageSize { get; set; }
        public string HistoryId { get; set; }
        public ViewMovieDetailsInWatchHistoryQuery(string email, int pageSize, string historyId)
        {
            Email = email;
            PageSize = pageSize;
            HistoryId = historyId;
        }
    }
}
