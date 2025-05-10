using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.WatchHistories
{
    public class ContinueWatchHistoryCommand : IRequest<Result<bool>>
    {
        public string Email { get; set; }
        public int MovieId { get; set; }
        public ContinueWatchHistoryCommand(string email, int movieId)
        {
            Email = email;
            MovieId = movieId;
        }
    }
}
