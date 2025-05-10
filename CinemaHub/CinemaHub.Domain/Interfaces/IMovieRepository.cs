using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IMovieRepository
    {
        Task<List<Movie>> ViewAllMoviesAsync(bool status, int pageSize, string movieId);

        Task<List<Movie>> ViewAllMoviePendingAsync(int pageSize, string movieId);

        Task<Movie> ViewMovieByIdAsync(int id);

        Task<List<Movie>> SearchMovieTitleAsync(string title, int pageSize, string movieId);

        Task<List<Movie>> SearchMovieByGerneAsync(List<string> movieGenre, int movieId);

        Task<List<Movie>> SearchMovieByLanguageAsync(string language);

        void CreateNewMovieAsync(Movie movie);

        void UpdateMovieAsync(Movie movie);

        void RemoveMovieAsync(Movie movie);

        Task<List<int>> GetAllMovieYearAsync();

        Task<List<string>> GetAllMovieLanguageAsync();

        Task<List<Movie>> SearchMovieByGenreAndLanguageAndYearAsync(string gerneName, string language, int year, int pageSize, string lastMovie);

        Task<List<string>> ViewAllMovieTitleAsync();

        Task<Movie> ViewMovieHistoryByIdAsync(int id);
    }
}
