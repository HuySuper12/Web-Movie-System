using CinemaHub.Application.DTOs.Request;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.UserFavorites
{
    public class CheckUserFavoriteQuery : IRequest<Result<bool>>
    {
        public WishListRequest WishListRequest { get; set; }

        public CheckUserFavoriteQuery(WishListRequest wishListRequest) 
        { 
            WishListRequest = wishListRequest;
        }
    }
}
