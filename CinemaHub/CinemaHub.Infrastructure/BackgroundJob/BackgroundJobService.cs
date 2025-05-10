using CinemaHub.Application.Interfaces.External;
using CinemaHub.Domain.Interfaces;
using Hangfire;
using Microsoft.Extensions.Options;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.BackgroundJob
{
    public class BackgroundJobService : IBackgroundJobService
    {
        private readonly IBackgroundJobClient _backgroundJob;

        public BackgroundJobService(IBackgroundJobClient backgroundJobClient)
        {
            _backgroundJob = backgroundJobClient;
        }

        public void Enqueue<T>(Expression<Action<T>> methodCall)
        {
            _backgroundJob.Enqueue(methodCall);
        }

        public string Schedule<T>(Expression<Action<T>> methodCall, TimeSpan delay)
        {
            return _backgroundJob.Schedule(methodCall, delay);
        }

        public string Schedule<T>(Expression<Action<T>> methodCall, DateTimeOffset enqueueAt)
        {
            return _backgroundJob.Schedule(methodCall, enqueueAt);
        }

        public void AddOrUpdate<T>(string recurringJobId, Expression<Action<T>> methodCall, string cronExpression)
        {
            RecurringJob.AddOrUpdate(recurringJobId, methodCall, cronExpression);
        }

        public void Delete(string jobId)
        {
            _backgroundJob.Delete(jobId);
        }
    }

}
