using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Movies
{
    public class RemoveMovieCommand : IRequest<Result<bool>>
    {
        public int MovieId { get; set; }

        public RemoveMovieCommand(int movieId)
        {
            MovieId = movieId;
        }
    }
}
