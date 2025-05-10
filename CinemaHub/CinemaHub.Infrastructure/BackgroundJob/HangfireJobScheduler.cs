using CinemaHub.Application.Interfaces.Internal;
using Hangfire;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.BackgroundJob
{
    public class HangfireJobScheduler
    {
        public static void RegisterJobs(IServiceProvider serviceProvider)
        {
            using (var scope = serviceProvider.CreateScope())
            {
                var jobService = scope.ServiceProvider.GetRequiredService<IJobService>();           //Khởi tạo dịch vụ

                AutoUnlockAccountCustomer(jobService);
                AutoUpdateMoviePending(jobService);
                AutoUpdateSubscriptionPlanPending(jobService);
            }
        }

        public static void AutoUnlockAccountCustomer(IJobService jobService)
        {
            RecurringJob.AddOrUpdate(
                    "AutoUnlockAccountCustomer",                                                    // Tên job
                    () => jobService.EnqueueAutoUnlockAccountCustomerFromAPIAsync(),                // Hàm cần thực thi
                    Cron.Minutely()                                                                 // Chạy mỗi 1 phút
                );
        }

        public static void AutoUpdateSubscriptionPlanPending(IJobService jobService)
        {
            RecurringJob.AddOrUpdate(
                "AutoUpdateSubscriptionPlanPending", // Tên job
                () => jobService.EnqueueAutoUpdateSubscriptionPlanPendingFromAPIAsync(), // Hàm cần thực thi
                Cron.Weekly(DayOfWeek.Sunday, 0) // Chạy 12h CN
            );
        }


        public static void AutoUpdateMoviePending(IJobService jobService)
        {
            RecurringJob.AddOrUpdate(
                    "AutoUpdateMoviePending",                                                       // Tên job
                    () => jobService.EnqueueAutoUpdateMoviePendingFromAPIAsync(),                   // Hàm cần thực thi
                    Cron.Weekly(DayOfWeek.Sunday, 0)                                                // Chạy 12h CN
                );
        }
    }
}
