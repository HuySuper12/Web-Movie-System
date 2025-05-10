using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface ICommentRepository
    {
        void AddCommentAsync(Comment comment);

        void RemoveCommentAsync(Comment comment);

        public Task<List<Comment>> ViewAllCommentsAsync(int pageSize, string commentId);
        public Task<List<Comment>> ViewAllCommentByMovieIdAsync(Comment comment, int pageSize, string commentId);

        public Task<Comment> ViewCommentByIdAsync(int id);
    }
}
