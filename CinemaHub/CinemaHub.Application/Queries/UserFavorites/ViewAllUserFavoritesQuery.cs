using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.UserFavorites
{
    public class ViewAllUserFavoritesQuery : IRequest<Result<List<UserFavorite>>>
    {

    }
}
