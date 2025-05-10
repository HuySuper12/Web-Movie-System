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
    public class MovieGenreRepository : IMovieGenreRepository
    {
        private readonly CinemaHubContext _context;

        public MovieGenreRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void CreateNewGenreAsync(MovieGenre movieGenre)
        {
            _context.MovieGenres.Add(movieGenre);
        }

        public async Task<MovieGenre> GetGenreByIdAsync(int id)
        {
            var result = await _context.MovieGenres.FirstOrDefaultAsync(x => x.GenreId == id);
            if (result != null)
            {
                _context.AttachIfNotTracked(result);
            }
            return result;
        }

        public async Task<MovieGenre> GetGenreByNameAsync(string name)
        {

            var result = await _context.MovieGenres.AsNoTracking().FirstOrDefaultAsync(x => x.GenreName.ToLower() == name.ToLower());
            if (result != null)
            {
                _context.AttachIfNotTracked(result); // Chắc chắn luôn được tracking
            }
            return result;
        }

        public void RemoveGenreAsync(MovieGenre movieGenre)
        {
            _context.MovieGenres.Remove(movieGenre);
        }

        public void UpdateGenreAsync(MovieGenre movieGenre)
        {
            _context.MovieGenres.Update(movieGenre);
        }

        public async Task<List<MovieGenre>> ViewAllGenresAsync()
        {
            return await _context.MovieGenres.Include("Movies").AsNoTracking().ToListAsync();
        }
    }
}
