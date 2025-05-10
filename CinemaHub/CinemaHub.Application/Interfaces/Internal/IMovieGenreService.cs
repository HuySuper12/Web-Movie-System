using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IMovieGenreService
    {
        Task<Result<List<MovieGenre>>> ViewAllGenresFromAPIAsync();

        Task<Result<MovieGenre>> GetGenreByIdFromAPIAsync(int id);

        Task<Result<MovieGenre>> GetGenreByNameFromAPIAsync(string name);

        Task<Result<bool>> CreateNewGenreFromAPIAsync(MovieGenre movieGenre);

        Task<Result<bool>> UpdateGenreFromAPIAsync(MovieGenre movieGenre);

        Task<Result<bool>> RemoveGenreFromAPIAsync(int id);
    }
}
