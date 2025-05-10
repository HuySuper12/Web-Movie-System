using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.MovieGenres
{
    public class ViewAllGenresQuery : IRequest<Result<List<MovieGenre>>>
    {

    }
}
