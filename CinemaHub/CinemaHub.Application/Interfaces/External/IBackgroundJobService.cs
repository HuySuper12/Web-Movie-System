using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.External
{
    public interface IBackgroundJobService
    {
        void Enqueue<T>(Expression<Action<T>> methodCall); // Fire-and-forget
        string Schedule<T>(Expression<Action<T>> methodCall, TimeSpan delay); // Schedule job
        string Schedule<T>(Expression<Action<T>> methodCall, DateTimeOffset enqueueAt);
        void AddOrUpdate<T>(string recurringJobId, Expression<Action<T>> methodCall, string cronExpression); // Recurring job
        void Delete(string jobId);
    }
}
