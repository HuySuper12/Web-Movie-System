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
    public class ViewAccountRoleQuery : IRequest<Result<List<AccountResponse>>>
    {
        public string Role { get; set; }

        public ViewAccountRoleQuery(string role) 
        { 
            Role = role; 
        }
    }
}
