using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.MovieGenres
{
    public class CreateGenreCommand : IRequest<Result<bool>>
    {
        public MovieGenre MovieGenre { get; set; }
        public CreateGenreCommand(MovieGenre movieGenre)
        {
            MovieGenre = movieGenre;
        }
    }
}
