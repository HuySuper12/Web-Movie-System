using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IMovieGenreRepository
    {
        Task<List<MovieGenre>> ViewAllGenresAsync();

        Task<MovieGenre> GetGenreByIdAsync(int id);

        Task<MovieGenre> GetGenreByNameAsync(string name);

        void CreateNewGenreAsync(MovieGenre movieGenre);

        void UpdateGenreAsync(MovieGenre movieGenre);

        void RemoveGenreAsync(MovieGenre movieGenre);
    }
}
