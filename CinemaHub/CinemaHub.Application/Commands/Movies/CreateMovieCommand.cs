using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Movies
{
    public class CreateMovieCommand : IRequest<Result<bool>>
    {
        public MovieRequest MovieRequest { get; set; }

        public CreateMovieCommand(MovieRequest movieRequest)
        {
            MovieRequest = movieRequest;
        }

    }
}
