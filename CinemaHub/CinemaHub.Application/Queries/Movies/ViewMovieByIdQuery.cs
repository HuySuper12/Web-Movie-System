using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Movies
{
    public class ViewMovieByIdQuery : IRequest<Result<Movie>>
    {
        public int Id { get; set; }
        public ViewMovieByIdQuery(int id)
        {
            Id = id;
        }
    }
}
