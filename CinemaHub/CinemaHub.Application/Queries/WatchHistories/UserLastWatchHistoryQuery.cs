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
    public class UserLastWatchHistoryQuery : IRequest<Result<WatchHistory>>
    {
        public string Email { get; set; }
        public int MovieId { get; set; }
        public UserLastWatchHistoryQuery(string email, int movieId)
        {
            Email = email;
            MovieId = movieId;
        }
    }
}
