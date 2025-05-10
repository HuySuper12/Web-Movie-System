using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.MovieGenres
{
    public class DeleteGenreCommand : IRequest<Result<bool>>
    {
        public int Id { get; set; } 
        public DeleteGenreCommand(int id)
        {
            Id = id;
        }
    }
}
