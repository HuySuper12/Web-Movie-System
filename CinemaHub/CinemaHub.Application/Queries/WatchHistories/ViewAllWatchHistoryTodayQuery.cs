using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.WatchHistories
{
    public class ViewAllWatchHistoryTodayQuery : IRequest<Result<int>>
    {
        public string Search { get; set; }
        public ViewAllWatchHistoryTodayQuery(string search)
        {
            Search = search;
        }
    }
}
