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
    public class ViewAllUserFavoritesQueryHandler : IRequestHandler<ViewAllUserFavoritesQuery, Result<List<UserFavorite>>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public ViewAllUserFavoritesQueryHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<List<UserFavorite>>> Handle(ViewAllUserFavoritesQuery request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.ViewAllUserFavoritesFromAPIAsync();
        }
    }
}
