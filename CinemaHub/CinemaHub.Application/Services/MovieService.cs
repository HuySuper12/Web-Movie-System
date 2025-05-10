using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class MovieService : IMovieService
    {
        private readonly IMovieRepository _movieRepository;
        private readonly IMovieGenreRepository _movieGenreRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;
        private readonly IAccountRepository _accountRepository;


        public MovieService(IMovieRepository movieRepository, IMovieGenreRepository movieGenreRepository, IUnitOfWork unitOfWork, IResponseCache responseCache, IAccountRepository accountRepository)
        {
            _movieRepository = movieRepository;
            _movieGenreRepository = movieGenreRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
            _accountRepository = accountRepository;
        }

        public async Task<Result<bool>> CheckMovieFromAPIAsync(int movieId, bool status)
        {
            var result = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (result == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            result.Status = status;
            _movieRepository.UpdateMovieAsync(result);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Movie
            await _responseCache.DeleteKeyInRedis("Movie");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> CreateNewMovieFromAPIAsync(MovieRequest movie)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(movie.EmailStaff);

            if (account == null)
            {
                return Result.Fail<bool>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var newMovie = new Movie()
            {
                Title = movie.Title,
                Description = movie.Description,
                Language = movie.Language,
                Duration = movie.Duration,
                ReleaseDate = movie.ReleaseDate,
                Thumbnail = movie.Thumbnail,
                TrailerUrl = movie.TrailerUrl,
                VideoUrl = movie.VideoUrl,
                UploadedBy = account.Id,
                Director = movie.Director,
            };

            foreach (var genre in movie.GerneName)
            {
                var existingGenre = await _movieGenreRepository.GetGenreByNameAsync(genre);

                if (existingGenre != null)
                {
                    // Thêm thể loại đã có vào movie mà không tạo mới bản ghi
                    newMovie.Genres.Add(existingGenre);
                }
                else
                {
                    // Nếu thể loại không có sẵn, bạn có thể xử lý theo cách khác (ví dụ: thông báo lỗi)
                    throw new Exception($"Genre with GenreName {genre} not found.");
                }
            }

            _movieRepository.CreateNewMovieAsync(newMovie);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Movie
            await _responseCache.DeleteKeyInRedis("Movie");
            return Result.Ok(true);
        }

        public async Task<Result<List<string>>> GetAllMovieLanguageFromAPIAsync()
        {
            var result = await _movieRepository.GetAllMovieLanguageAsync();
            if(result.Count == 0)
            {
                return Result.Fail<List<string>> (new Error("Not found language").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<int>>> GetAllMovieYearFromAPIAsync()
        {
            var result = await _movieRepository.GetAllMovieYearAsync();
            if (result.Count == 0)
            {
                return Result.Fail<List<int>>(new Error("Not found year").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<bool>> RemoveMovieFromAPIAsync(int movieId)
        {
            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            movie.Status = !(movie.Status ?? false);
            _movieRepository.UpdateMovieAsync(movie);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Movie
            await _responseCache.DeleteKeyInRedis("Movie");
            return Result.Ok(true);
        }

        public async Task<Result<List<Movie>>> SearchMovieByGenreAndLanguageAndYearFromAPIAsync(string gerneName, string language, int year, int pageSize, string lastMovie)
        {
            var result = await _movieRepository.SearchMovieByGenreAndLanguageAndYearAsync(gerneName, language, year, pageSize, lastMovie);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Movie>>> SearchMovieByGerneFromAPIAsync(string genreName, int movieId)
        {
            string[] list = genreName.Split(", ");
            var result = await _movieRepository.SearchMovieByGerneAsync(list.ToList(), movieId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            Random random = new Random();
            var resultList = result.OrderBy(x => random.Next()).Take(5).ToList();
            return Result.Ok(resultList);
        }

        public async Task<Result<List<Movie>>> SearchMovieByLanguageFromAPIAsync(string language)
        {
            var result = await _movieRepository.SearchMovieByLanguageAsync(language);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Movie>>> SearchMovieTitleAsync(string title, int pageSize, string movieId)
        {
            var result = await _movieRepository.SearchMovieTitleAsync(title, pageSize, movieId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<bool>> UpdateMovieFromAPIAsync(MovieRequest movie)
        {
            var searchMovie = await _movieRepository.ViewMovieByIdAsync(int.Parse(movie.Id));
            if (movie == null)
            {
                return Result.Fail<bool>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }

            var list = new List<MovieGenre>();
            foreach(var genreName in movie.GerneName)
            {
                var genre = await _movieGenreRepository.GetGenreByNameAsync(genreName);
                if(genre != null)
                {
                    list.Add(genre);
                }
            }

            // Cập nhật quan hệ nhiều-nhiều (Genres)
            var newGenres = list.Select(g => g.GenreId).ToList(); // ID của các thể loại mới
            var existingGenres = searchMovie.Genres.Select(g => g.GenreId).ToList(); // ID của các thể loại hiện tại

            // Xóa các thể loại không còn liên quan
            var genresToRemove = searchMovie.Genres
                .Where(g => !newGenres.Contains(g.GenreId))
                .ToList();

            foreach (var genre in genresToRemove)
            {
                searchMovie.Genres.Remove(genre);
            }

            // Thêm các thể loại mới
            var genresToAdd = list
                .Where(g => !existingGenres.Contains(g.GenreId))
                .ToList();

            foreach (var genre in genresToAdd)
            {
                searchMovie.Genres.Add(genre);
            }

            if (searchMovie.Title == movie.Title && searchMovie.Description == movie.Description && searchMovie.Language == movie.Language && searchMovie.Duration == movie.Duration && searchMovie.ReleaseDate == movie.ReleaseDate && searchMovie.Thumbnail == movie.Thumbnail && searchMovie.TrailerUrl == movie.TrailerUrl && searchMovie.VideoUrl == movie.VideoUrl && searchMovie.Director == movie.Director && (genresToRemove.Count() == 0 && genresToAdd.Count() == 0))
            {
                return Result.Fail<bool>(new Error("No changes detected").WithMetadata("StatusCode", 204));
            }

            searchMovie.Title = movie.Title;
            searchMovie.Description = movie.Description;
            searchMovie.Language = movie.Language;
            searchMovie.Duration = movie.Duration;
            searchMovie.ReleaseDate = movie.ReleaseDate;
            searchMovie.Thumbnail = movie.Thumbnail;
            searchMovie.TrailerUrl = movie.TrailerUrl;
            searchMovie.VideoUrl = movie.VideoUrl;
            searchMovie.Director = movie.Director;

            _movieRepository.UpdateMovieAsync(searchMovie);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Movie
            await _responseCache.DeleteKeyInRedis("Movie");
            return Result.Ok(true);
        }

        public async Task<Result<List<Movie>>> ViewAllMoviePendingFromAPIAsync(int pageSize, string movieId)
        {
            var result = await _movieRepository.ViewAllMoviePendingAsync(pageSize, movieId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Movie>>> ViewAllMoviesFromAPIAsync(bool status, int pageSize, string movieId)
        {
            var result = await _movieRepository.ViewAllMoviesAsync(status, pageSize, movieId);
            if (result.Count == 0)
            {
                return Result.Fail<List<Movie>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<string>>> ViewAllMovieTitleFromAPIAsync()
        {
            var result = await _movieRepository.ViewAllMovieTitleAsync();
            if (result.Count == 0)
            {
                return Result.Fail<List<string>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<Movie>> ViewMovieByIdFromAPIAsync(int id)
        {
            var result = await _movieRepository.ViewMovieByIdAsync(id);
            if (result == null)
            {
                return Result.Fail<Movie>(new Error("Movie not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<string>>> ViewMovieGenreWish(List<int> movieId)
        {
            var list = new List<string>();
            foreach (var id in movieId)
            {
                string genreName = "";
                var movie = await _movieRepository.ViewMovieByIdAsync(id);

                if (movie == null)
                {
                    return Result.Fail<List<string>>(new Error("Movie not found").WithMetadata("StatusCode", 404));
                }

                foreach (var genre in movie.Genres)
                {
                    if (genreName.IsNullOrEmpty())
                        genreName += genre.GenreName;
                    else
                        genreName += ", " + genre.GenreName;

                }
                list.Add(genreName);
            }

            return Result.Ok(list);
        }
    }
}
