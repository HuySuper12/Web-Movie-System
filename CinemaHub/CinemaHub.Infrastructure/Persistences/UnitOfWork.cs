using CinemaHub.Domain.Interfaces;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Persistences
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly CinemaHubContext _context;
        private IDbContextTransaction _transaction;

        public IAccountRepository _accountRepository;
        public IAuthRepository _authRepository;
        public ICommentRepository _commentRepository;
        public IMovieGenreRepository _movieGenreRepository;
        public IMovieRepository _movieRepository;
        public INotificationRepository _notificationRepository;
        public IPaymentRepository _paymentRepository;
        public IRatingRepository _ratingRepository;
        public ISubscriptionPlanRepository _subscriptionPlanRepository;
        public IUserFavoriteRepository _userFavoriteRepository;
        public IWatchHistoryRepository _watchHistoryRepository;

        public UnitOfWork(CinemaHubContext context, IAccountRepository accountRepository, IAuthRepository authRepository, IMovieRepository movieRepository, IMovieGenreRepository movieGenreRepository, IPaymentRepository paymentRepository, IRatingRepository ratingRepository, ISubscriptionPlanRepository subscriptionPlanRepository, IUserFavoriteRepository userFavoriteRepository, INotificationRepository notificationRepository, IWatchHistoryRepository watchHistoryRepository)
        {
            _context = context;
            _accountRepository = accountRepository;
            _authRepository = authRepository;
            _movieRepository = movieRepository;
            _movieGenreRepository = movieGenreRepository;
            _notificationRepository = notificationRepository;
            _paymentRepository = paymentRepository;
            _ratingRepository = ratingRepository;
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _userFavoriteRepository = userFavoriteRepository;
            _watchHistoryRepository = watchHistoryRepository;
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public async Task BeginTransactionAsync()
        {
            if (_transaction != null)
            {
                return;
            }

            _transaction = await _context.Database.BeginTransactionAsync();
        }

        public async Task CommitTransactionAsync()
        {
            try
            {
                await _context.SaveChangesAsync();
                await _transaction?.CommitAsync();
            }
            catch
            {
                await RollbackTransactionAsync();
                throw;
            }
            finally
            {
                await _transaction.DisposeAsync();
                _transaction = null;
            }
        }

        public async Task RollbackTransactionAsync()
        {
            if (_transaction != null)
            {
                await _transaction.RollbackAsync();
                await _transaction.DisposeAsync();
                _transaction = null;
            }
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }

}
