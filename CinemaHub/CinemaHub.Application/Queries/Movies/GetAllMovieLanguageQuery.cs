using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Movies
{
    public class GetAllMovieLanguageQuery : IRequest<Result<List<string>>>
    {
    }
}
