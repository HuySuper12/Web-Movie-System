using CinemaHub.Application.Commands.UserFavorites;
using CinemaHub.Application.Interfaces.Internal;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.CommandsHandler.UserFavorites
{
    public class RemoveFavoriteCommandHandler : IRequestHandler<RemoveFavoriteCommand, Result<bool>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public RemoveFavoriteCommandHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<bool>> Handle(RemoveFavoriteCommand request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.RemoveFavoriteFromAPIAsync(request.WishListRequest);
        }
    }
}
