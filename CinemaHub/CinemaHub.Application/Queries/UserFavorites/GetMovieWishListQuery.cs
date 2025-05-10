using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.UserFavorites
{
    public class GetMovieWishListQuery  : IRequest<Result<List<int>>>
    {
        public string Email { get; set; }
        public int PageSize { get; set; }
        public string FavoriteId { get; set; }

        public GetMovieWishListQuery(string email, int pageSize, string favoriteId)
        {
            Email = email;
            PageSize = pageSize;
            FavoriteId = favoriteId;
        }
    }
}
