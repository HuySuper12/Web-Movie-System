using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Interfaces
{
    public interface IUnitOfWork : IDisposable
    {
        // Repository
        //IGenreRepository Genres { get; }
        //IUserRepository Users { get; }
        //ISubscriptionRepository Subscriptions { get; }
        //IInvoiceRepository Invoices { get; }

        // Save changes
        Task<int> SaveChangesAsync();

        // Transaction (optional but important)
        Task BeginTransactionAsync();
        Task CommitTransactionAsync();
        Task RollbackTransactionAsync();
    }
}
