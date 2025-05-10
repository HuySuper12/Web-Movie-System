using CinemaHub.Domain.Entities;
using FluentResults;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Queries.Comments
{
    public class ViewAllCommentsQuery : IRequest<Result<List<Comment>>>
    {
        public int PageSize { get; set; }
        public string CommentId { get; set; }

        public ViewAllCommentsQuery(int pageSize, string commentId) 
        {
            PageSize = pageSize;
            CommentId = commentId;
        }
    }
}
