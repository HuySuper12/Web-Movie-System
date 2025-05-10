using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Application.Queries.UserFavorites;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.QueriesHandler.UserFavorites
{
    public class GetMovieWishListQueryHandler : IRequestHandler<GetMovieWishListQuery, Result<List<int>>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public GetMovieWishListQueryHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<List<int>>> Handle(GetMovieWishListQuery request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.GetMovieWishListFromAPIAsync(request.Email, request.PageSize, request.FavoriteId);
        }
    }
}
