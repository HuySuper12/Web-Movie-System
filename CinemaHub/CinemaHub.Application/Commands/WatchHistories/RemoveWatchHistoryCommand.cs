using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.WatchHistories
{
    public class RemoveWatchHistoryCommand : IRequest<Result<bool>>
    {
        public int HistoryId { get; set; }
        public RemoveWatchHistoryCommand(int historyId)
        {
            HistoryId = historyId;
        }
    }
}
