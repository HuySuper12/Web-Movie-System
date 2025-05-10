using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IRatingRepository
    {
        void AddRatingAsync(Rating rating);

        void RemoveRatingAsync(Rating rating);

        Task<List<Rating>> ViewAllRatingsAsync();
        Task<List<Rating>> ViewAllRatingByMovieIdAsync(Rating rating);
        Task<List<Rating>> ViewAllRatingByMovieIdAsync(Rating rating, int pageSize, string ratingId);

        Task<double> CalculateRatingAverageAsync(Rating rating);

        Task<Rating> ViewRatingByIdAsync(int ratingId);
    }
}
