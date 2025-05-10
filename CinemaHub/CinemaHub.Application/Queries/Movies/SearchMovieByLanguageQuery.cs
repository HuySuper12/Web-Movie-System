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
    public class SearchMovieByLanguageQuery : IRequest<Result<List<Movie>>>
    {
        public string Language { get; set; }

        public SearchMovieByLanguageQuery(string language)
        {
            Language = language;
        }
    }
}
