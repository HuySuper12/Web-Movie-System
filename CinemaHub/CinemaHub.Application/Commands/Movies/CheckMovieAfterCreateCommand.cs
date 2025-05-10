using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Movies
{
    public class CheckMovieAfterCreateCommand : IRequest<Result<bool>>
    {
        public int MovieId { get; set; }
        public bool Status { get; set; }
        public CheckMovieAfterCreateCommand(int movieId, bool status)
        {
            MovieId = movieId;
            Status = status;
        }
    }
}
