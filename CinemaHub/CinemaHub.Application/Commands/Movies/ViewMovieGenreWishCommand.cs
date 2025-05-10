using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Movies
{
    public class ViewMovieGenreWishCommand : IRequest<Result<List<string>>>
    {
        public List<int> Movies { get; set; } = new List<int>();

    }
}
