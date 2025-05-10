using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class RatingService : IRatingService
    {
        private readonly IRatingRepository _ratingRepository;
        private readonly IAccountRepository _accountRepository; 
        private readonly IMovieRepository _movieRepository;
        private readonly IUnitOfWork _unitOfWork;   
        private readonly IResponseCache _responseCache;

        public RatingService(IRatingRepository ratingRepository, IAccountRepository accountRepository, IMovieRepository movieRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _ratingRepository = ratingRepository;
            _accountRepository = accountRepository;
            _movieRepository = movieRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> AddRatingFromAPIAsync(CommentRatingRequest rating)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(rating.Email);
            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var movie = await _movieRepository.ViewMovieByIdAsync(rating.MovieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var newRating = new Rating
            {
                MovieId = rating.MovieId,
                UserId = account.Id,
                Rating1 = rating.Rating1,
                CreatedAt = DateTime.Now,
                Status = true
            };
            _ratingRepository.AddRatingAsync(newRating);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Rating
            await _responseCache.DeleteKeyInRedis("Rating");
            return Result.Ok(true);
        }

        public async Task<Result<double>> CalculateRatingAverageFromAPIAsync(int movieId)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<double>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var avg = await _ratingRepository.CalculateRatingAverageAsync(new Rating() { MovieId = movieId });
            if(avg == 0)
            {
                return Result.Fail<double>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }

            return Result.Ok(avg);
        }

        public async Task<Result<bool>> RemoveRatingFromAPIAsync(int ratingId)
        {
            var rating = await _ratingRepository.ViewRatingByIdAsync(ratingId);

            if(rating == null)
            {
                return Result.Fail<bool>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }

            rating.Status = false;
            _ratingRepository.RemoveRatingAsync(rating);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Rating
            await _responseCache.DeleteKeyInRedis("Rating");
            return Result.Ok(true);
        }

        public async Task<Result<List<Rating>>> ViewAllRatingByMovieIdFromAPIAsync(int movieId)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<List<Rating>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var rating = await _ratingRepository.ViewAllRatingByMovieIdAsync(new Rating() { MovieId = movieId, Status = true });
            if (rating.Count() == 0)
            {
                return Result.Fail<List<Rating>>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }

            return Result.Ok(rating);
        }

        public async Task<Result<List<Rating>>> ViewAllRatingByMovieIdFromAPIAsync(int movieId, int pageSize, string ratingId)
        {
            var checkMovie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (checkMovie == null)
            {
                return Result.Fail<List<Rating>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = await _ratingRepository.ViewAllRatingByMovieIdAsync(new Rating() { MovieId = movieId, Status = true}, pageSize, ratingId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Rating>>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Rating>>> ViewAllRatingsFromAPIAsync()
        {
            var result = await _ratingRepository.ViewAllRatingsAsync();
            if (result.Count == 0)
            {
                return Result.Fail<List<Rating>>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<Rating>> ViewRatingByIdFromAPIAsync(int ratingId)
        {
            var result = await _ratingRepository.ViewRatingByIdAsync(ratingId);
            if (result == null)
            {
                return Result.Fail<Rating>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<ViewRatingStatisticResponse>>> ViewRatingStatisticAsync(bool status, int pageSize, string movieId)
        {
            var movies = await _movieRepository.ViewAllMoviesAsync(status, pageSize, movieId);
            if(movies.Count == 0)
            {
                return Result.Fail<List<ViewRatingStatisticResponse>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var result = new List<ViewRatingStatisticResponse>();
            foreach (var movie in movies)
            {
                var ratings = await _ratingRepository.ViewAllRatingByMovieIdAsync(new Rating() { MovieId = movie.MovieId, Status = status });
                double averageRating = 0;
                if (ratings.Count != 0)
                {
                    averageRating = Math.Round(ratings.Average(x => x.Rating1), 1);
                }

                var viewRatingStatistic = new ViewRatingStatisticResponse
                {
                    Id = movie.MovieId,
                    Thumbnail = movie.Thumbnail,
                    Title = movie.Title,
                    Director = movie.Director,
                    AverageRating = averageRating,
                    TotalRatings = ratings.Count,
                    TotalViews = movie.WatchHistories.Count
                };
                result.Add(viewRatingStatistic);
            }
            return Result.Ok(result);
        }
    }
}
