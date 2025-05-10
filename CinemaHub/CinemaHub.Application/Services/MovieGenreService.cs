using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class MovieGenreService : IMovieGenreService
    {
        private readonly IMovieGenreRepository _movieGenreRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;

        public MovieGenreService(IMovieGenreRepository movieGenreRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _movieGenreRepository = movieGenreRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> CreateNewGenreFromAPIAsync(MovieGenre movieGenre)
        {
            _movieGenreRepository.CreateNewGenreAsync(movieGenre);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den MovieGenre
            await _responseCache.DeleteKeyInRedis("MovieGenre");

            return Result.Ok(true);
        }

        public async Task<Result<MovieGenre>> GetGenreByIdFromAPIAsync(int id)
        {
            var genre = await _movieGenreRepository.GetGenreByIdAsync(id);
            if (genre == null)
            {
                return Result.Fail<MovieGenre>(new Error("Genre not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(genre);
        }

        public async Task<Result<MovieGenre>> GetGenreByNameFromAPIAsync(string name)
        {
            var genre = await _movieGenreRepository.GetGenreByNameAsync(name);
            if (genre == null)
            {
                return Result.Fail<MovieGenre>(new Error("Genre not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(genre);
        }

        public async Task<Result<bool>> RemoveGenreFromAPIAsync(int id)
        {
            var genre = await _movieGenreRepository.GetGenreByIdAsync(id);
            if (genre == null)
            {
                return Result.Fail<bool>(new Error("Genre not found").WithMetadata("StatusCode", 404));
            }

            _movieGenreRepository.RemoveGenreAsync(genre);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den MovieGenre
            await _responseCache.DeleteKeyInRedis("MovieGenre");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> UpdateGenreFromAPIAsync(MovieGenre movieGenre)
        {
            var genre = await _movieGenreRepository.GetGenreByIdAsync(movieGenre.GenreId);

            if (genre == null)
            {
                return Result.Fail<bool>(new Error("Genre not found").WithMetadata("StatusCode", 404));
            }

            if (genre.GenreName == movieGenre.GenreName)
            {
                return Result.Fail<bool>(new Error("Duplicate genre name").WithMetadata("StatusCode", 409));
            }

            genre.GenreName = movieGenre.GenreName;
            _movieGenreRepository.UpdateGenreAsync(genre);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den MovieGenre
            await _responseCache.DeleteKeyInRedis("MovieGenre");
            return Result.Ok(true);

        }

        public async Task<Result<List<MovieGenre>>> ViewAllGenresFromAPIAsync()
        {
            var result = await _movieGenreRepository.ViewAllGenresAsync();
            if (result.Count == 0)
            {
                return Result.Fail<List<MovieGenre>>(new Error("Genre not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
