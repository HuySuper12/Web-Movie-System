using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.UserFavorites
{
    public class RemoveFavoriteCommand : IRequest<Result<bool>> 
    {
        public WishListRequest WishListRequest { get; set; }

        public RemoveFavoriteCommand(WishListRequest wishListRequest)
        {
            WishListRequest = wishListRequest;
        }
    }
}
