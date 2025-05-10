using CinemaHub.Application.DTOs.Response;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Ratings
{
    public class ViewRatingStatisticQuery : IRequest<Result<List<ViewRatingStatisticResponse>>>
    {
        public bool Status { get; set; }
        public int PageSize { get; set; }
        public string MovieId { get; set; }

        public ViewRatingStatisticQuery(bool status, int pageSize, string movieId) 
        {
            Status = status;
            PageSize = pageSize;
            MovieId = movieId;
        }
    }
}
