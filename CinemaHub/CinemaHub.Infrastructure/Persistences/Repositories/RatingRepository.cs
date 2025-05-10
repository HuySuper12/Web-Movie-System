using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class RatingRepository : IRatingRepository
    {
        private readonly CinemaHubContext _context;

        public RatingRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void AddRatingAsync(Rating rating)
        {
            _context.Ratings.Add(rating);
        }

        public async Task<double> CalculateRatingAverageAsync(Rating rating)
        {
            var result = await _context.Ratings.Where(r => r.MovieId == rating.MovieId && r.Status == true).AverageAsync(r => r.Rating1);
            return Math.Round(result, 1);
        }

        public void RemoveRatingAsync(Rating rating)
        {
            _context.Ratings.Update(rating);
        }

        public async Task<List<Rating>> ViewAllRatingByMovieIdAsync(Rating rating)
        {
            return await _context.Ratings.Where(r => r.MovieId == rating.MovieId && r.Status == true).AsNoTracking().ToListAsync();
        }

        public async Task<List<Rating>> ViewAllRatingByMovieIdAsync(Rating rating, int pageSize, string ratingId)
        {
            var query = _context.Ratings.Where(r => r.MovieId == rating.MovieId && r.Status == true).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(ratingId))
            {
                query = query.Where(r => r.RatingId < int.Parse(ratingId)).OrderByDescending(r => r.RatingId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<List<Rating>> ViewAllRatingsAsync()
        {
            return await _context.Ratings.AsNoTracking().ToListAsync();
        }

        public async Task<Rating> ViewRatingByIdAsync(int ratingId)
        {
            return await _context.Ratings.AsNoTracking().FirstOrDefaultAsync(r => r.RatingId == ratingId);
        }
    }
}
