using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences.Repositories
{
    public class CommentRepository : ICommentRepository
    {
        private readonly CinemaHubContext _context;

        public CommentRepository(CinemaHubContext context)
        {
            _context = context;
        }

        public void AddCommentAsync(Comment comment)
        {
            _context.Comments.Add(comment);
        }

        public void RemoveCommentAsync(Comment comment)
        {
            _context.Comments.Update(comment);
        }

        public async Task<List<Comment>> ViewAllCommentByMovieIdAsync(Comment comment, int pageSize, string commentId)
        {
            var query = _context.Comments.Where(c => c.MovieId == comment.MovieId && c.Status == comment.Status).AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(commentId))
            {
                query = query.Where(comment => comment.CommentId < int.Parse(commentId)).OrderByDescending(c => c.CommentId);
            }


            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<List<Comment>> ViewAllCommentsAsync(int pageSize, string commentId)
        {
            var query = _context.Comments.AsNoTracking().AsQueryable();

            if (!string.IsNullOrEmpty(commentId))
            {
                query = query.Where(comment => comment.CommentId < int.Parse(commentId)).OrderByDescending(c => c.CommentId);
            }

            return await query.Take(pageSize).ToListAsync();
        }

        public async Task<Comment> ViewCommentByIdAsync(int id)
        {
            return await _context.Comments.AsNoTracking().FirstOrDefaultAsync(c => c.CommentId == id);
        }
    }
}
