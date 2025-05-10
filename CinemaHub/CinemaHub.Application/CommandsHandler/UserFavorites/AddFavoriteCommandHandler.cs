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
    public class AddFavoriteCommandHandler : IRequestHandler<AddFavoriteCommand, Result<bool>>
    {
        private readonly IUserFavoriteService _userFavoriteService;

        public AddFavoriteCommandHandler(IUserFavoriteService userFavoriteService)
        {
            _userFavoriteService = userFavoriteService;
        }

        public async Task<Result<bool>> Handle(AddFavoriteCommand request, CancellationToken cancellationToken)
        {
            return await _userFavoriteService.AddFavoriteFromAPIAsync(request.WishListRequest);
        }
    }
}
