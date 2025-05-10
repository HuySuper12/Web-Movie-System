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
    public class ViewUserFavoritesByEmailQueryHandler : IRequestHandler<ViewUserFavoritesByEmailQuery, Result<List<UserFavorite>>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public ViewUserFavoritesByEmailQueryHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<List<UserFavorite>>> Handle(ViewUserFavoritesByEmailQuery request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.ViewUserFavoritesByEmailFromAPIAsync(request.Email, request.PageSize, request.FavoriteId);
        }
    }
}
