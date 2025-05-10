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
    public class FilterGenreAndLanguageAndYearQuery : IRequest<Result<List<Movie>>>
    {
        public string GerneName { get; set; } 
        public string Language { get; set; }
        public int Year { get; set; }
        public int PageSize { get; set; }
        public string LastMovie { get; set; }

        public FilterGenreAndLanguageAndYearQuery(string gerneName, string language, int year, int pageSize, string lastMovie)
        {
            GerneName = gerneName;
            Language = language;
            Year = year;
            PageSize = pageSize;
            LastMovie = lastMovie;
        }
    }
}
