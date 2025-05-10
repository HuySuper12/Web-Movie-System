using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using FluentResults;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IRatingService
    {
        Task<Result<bool>> AddRatingFromAPIAsync(CommentRatingRequest rating);
        Task<Result<bool>> RemoveRatingFromAPIAsync(int ratingId);
        Task<Result<List<Rating>>> ViewAllRatingsFromAPIAsync();
        Task<Result<List<Rating>>> ViewAllRatingByMovieIdFromAPIAsync(int movieId);
        Task<Result<List<Rating>>> ViewAllRatingByMovieIdFromAPIAsync(int movieId, int pageSize, string ratingId);
        Task<Result<double>> CalculateRatingAverageFromAPIAsync(int movieId);
        Task<Result<Rating>> ViewRatingByIdFromAPIAsync(int ratingId);
        Task<Result<List<ViewRatingStatisticResponse>>> ViewRatingStatisticAsync(bool status, int pageSize, string movieId);
    }
}
