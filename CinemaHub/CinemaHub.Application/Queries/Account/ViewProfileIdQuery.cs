using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Account
{
    public class ViewProfileIdQuery : IRequest<Result<AccountResponse>>
    {
        public string ProfileId { get; set; }

        public ViewProfileIdQuery(string profileId) 
        { 
            ProfileId = profileId;
        }
    }
}
