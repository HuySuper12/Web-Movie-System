using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.UserFavorites;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.UserFavorites
{
    public class GetMovieByUserFavoritesQueryHandler : IRequestHandler<GetMovieByUserFavoritesQuery, Result<List<Movie>>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public GetMovieByUserFavoritesQueryHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<List<Movie>>> Handle(GetMovieByUserFavoritesQuery request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.GetMovieByUserFavoritesFromAPIAsync(request.Email, request.PageSize, request.FavoriteId);
        }
    }
}
