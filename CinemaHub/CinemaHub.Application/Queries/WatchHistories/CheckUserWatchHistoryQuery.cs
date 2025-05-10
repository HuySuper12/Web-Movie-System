using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CinemaHub.Domain.Entities;

namespace CinemaHub.Application.Queries.WatchHistories
{
    public class CheckUserWatchHistoryQuery : IRequest<Result<WatchHistory>>
    {
        public string Email { get; set; }
        public int MovieId { get; set; }
        public CheckUserWatchHistoryQuery(string email, int movieId)
        {
            Email = email;
            MovieId = movieId;
        }
    }
}
