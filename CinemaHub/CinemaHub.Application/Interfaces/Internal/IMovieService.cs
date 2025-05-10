using CinemaHub.Application.DTOs.Request;
using CinemaHub.Domain.Entities;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IMovieService
    {
        Task<Result<List<Movie>>> ViewAllMoviesFromAPIAsync(bool status, int pageSize, string movieId);

        Task<Result<List<Movie>>> ViewAllMoviePendingFromAPIAsync(int pageSize, string movieId);

        Task<Result<Movie>> ViewMovieByIdFromAPIAsync(int id);

        Task<Result<List<Movie>>> SearchMovieByGerneFromAPIAsync(string genreName, int movieId);

        Task<Result<List<Movie>>> SearchMovieByLanguageFromAPIAsync(string language);

        Task<Result<bool>> CreateNewMovieFromAPIAsync(MovieRequest movie);

        Task<Result<bool>> UpdateMovieFromAPIAsync(MovieRequest movie);

        Task<Result<bool>> RemoveMovieFromAPIAsync(int movieId);

        Task<Result<bool>> CheckMovieFromAPIAsync(int movieId, bool status);

        Task<Result<List<int>>> GetAllMovieYearFromAPIAsync();

        Task<Result<List<string>>> GetAllMovieLanguageFromAPIAsync();

        Task<Result<List<Movie>>> SearchMovieByGenreAndLanguageAndYearFromAPIAsync(string gerneName, string language, int year, int pageSize, string lastMovie);

        Task<Result<List<Movie>>> SearchMovieTitleAsync(string title, int pageSize, string movieId);

        Task<Result<List<string>>> ViewAllMovieTitleFromAPIAsync();

        Task<Result<List<string>>> ViewMovieGenreWish(List<int> movieId);
    }
}
