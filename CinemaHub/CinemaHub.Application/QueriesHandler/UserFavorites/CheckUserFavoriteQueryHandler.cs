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
    public class CheckUserFavoriteQueryHandler : IRequestHandler<CheckUserFavoriteQuery, Result<bool>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public CheckUserFavoriteQueryHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }
        public async Task<Result<bool>> Handle(CheckUserFavoriteQuery request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.CheckUserFavoriteFromAPIAsync(request.WishListRequest);
        }
    }
}
