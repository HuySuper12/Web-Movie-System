using CinemaHub.Application.DTOs.Response;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Account
{
    public class ViewAccountRolePaginationQuery : IRequest<Result<List<AccountResponse>>>
    {
        public string Role { get; set; }
        public int PageSize { get; set; }
        public string Id { get; set; }

        public ViewAccountRolePaginationQuery(string role, int pageSize, string userId)
        {
            Role = role;
            PageSize = pageSize;
            Id = userId;
        }
    }
}
