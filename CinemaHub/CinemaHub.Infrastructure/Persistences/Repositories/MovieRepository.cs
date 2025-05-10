using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using CinemaHub.Infrastructure.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class MovieRepository : IMovieRepository
    {
        private readonly CinemaHubContext _context;

        public MovieRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void CreateNewMovieAsync(Movie movie)
        {
            _context.Movies.Add(movie);
        }

        public async Task<List<string>> GetAllMovieLanguageAsync()
        {
            return await _context.Movies.Select(p => p.Language).Distinct().ToListAsync();
        }

        public async Task<List<int>> GetAllMovieYearAsync()
        {
            return await _context.Movies.Select(p => p.ReleaseDate.Value.Year).Distinct().ToListAsync();
        }

        public void RemoveMovieAsync(Movie movie)
        {
            _context.Movies.Remove(movie);
        }

        public async Task<List<Movie>> SearchMovieByGenreAndLanguageAndYearAsync(string gerneName, string language, int year, int pageSize, string lastMovie)
        {
            var query = _context.Movies.Where(p => p.Status == true).AsNoTracking().AsQueryable();

            if (gerneName != "null")
            {
                query = query.Where(movie => movie.Genres.Any(g => g.GenreName == gerneName));
            }

            if (language != "null")
            {
                query = query.Where(movie => movie.Language == language);
            }

            if (year != 0)
            {
                query = query.Where(movie => movie.ReleaseDate.Value.Year == year);
            }

            if (!string.IsNullOrEmpty(lastMovie))
            {
                query = query.Where(m => m.MovieId < int.Parse(lastMovie)).OrderByDescending(movie => movie.MovieId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<List<Movie>> SearchMovieByGerneAsync(List<string> movieGenre, int movieId)
        {
            var lowerGenres = movieGenre.Select(g => g.ToLower()).ToList();

            return await _context.Movies.Include(m => m.Genres).Where(m => m.Genres.Any(g => lowerGenres.Contains(g.GenreName.ToLower())) && m.Status == true).AsNoTracking().ToListAsync();
        }

        public async Task<List<Movie>> SearchMovieByLanguageAsync(string language)
        {
            return await _context.Movies.Include(m => m.Genres).Where(m => m.Language.ToLower() == language.ToLower()).AsNoTracking().ToListAsync();
        }

        public async Task<List<Movie>> SearchMovieTitleAsync(string title, int pageSize, string movieId)
        {
            var query = _context.Movies.Where(m => m.Title.ToLower().Contains(title.ToLower()) && m.Status == true).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(movieId))
            {
                query = query.Where(movie => movie.MovieId < int.Parse(movieId)).OrderByDescending(p => p.MovieId);
            }

            return await query.Include("Genres").Include("WatchHistories").Take(pageSize).ToListAsync();
        }

        public void UpdateMovieAsync(Movie movie)
        {
            _context.Movies.Update(movie);
        }

        public async Task<List<Movie>> ViewAllMoviePendingAsync(int pageSize, string movieId)
        {
            var query = _context.Movies.Where(movie => movie.Status == null).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(movieId))
            {
                query = query.Where(movie => movie.MovieId < int.Parse(movieId)).OrderByDescending(p => p.MovieId); //Keyset Pagination (Do phim mới nhất nằm trên
            }

            return await query.Include("Genres").Include("WatchHistories").Take(pageSize).ToListAsync();
        }

        public async Task<List<Movie>> ViewAllMoviesAsync(bool status, int pageSize, string movieId)
        {
            var query = _context.Movies.Where(movie => movie.Status == status).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(movieId))
            {
                query = query.Where(movie => movie.MovieId < int.Parse(movieId)).OrderByDescending(p => p.MovieId); //Keyset Pagination (Do phim mới nhất nằm trên
            }

            return await query.Include("Genres").Include("WatchHistories").Take(pageSize).ToListAsync();
        }

        public async Task<List<string>> ViewAllMovieTitleAsync()
        {
            return await _context.Movies.Select(m => m.Title).AsNoTracking().ToListAsync();
        }

        public async Task<Movie> ViewMovieByIdAsync(int id)
        {
            var result = await _context.Movies.Include("Genres").Include("WatchHistories").Include("Comments").AsNoTracking().FirstOrDefaultAsync(m => m.MovieId == id);
            if (result != null)
            {
                _context.AttachIfNotTracked(result);
            }
            return result;
        }

        public async Task<Movie> ViewMovieHistoryByIdAsync(int id)
        {
            var result = await _context.Movies.Include("Genres").Include("WatchHistories").Include("Comments").AsNoTracking().FirstOrDefaultAsync(m => m.MovieId == id);
            return result;
        }
    }
}
