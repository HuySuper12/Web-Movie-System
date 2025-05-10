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
    public class ViewProfileEmailQuery : IRequest<Result<AccountResponse>>
    {
        public string Email { get; set; }

        public ViewProfileEmailQuery(string email) 
        {
            Email = email;
        }
    }
}
