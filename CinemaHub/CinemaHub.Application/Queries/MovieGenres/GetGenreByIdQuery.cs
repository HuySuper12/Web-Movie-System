using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CinemaHub.Domain.Entities;
using FluentResults;

namespace CinemaHub.Application.Queries.MovieGenres
{
    public class GetGenreByIdQuery : IRequest<Result<MovieGenre>>
    {
        public int Id { get; set; }

        public GetGenreByIdQuery(int id)
        {
            Id = id;
        }
    }
}
