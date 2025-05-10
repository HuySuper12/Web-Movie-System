using CinemaHub.API.Middlewares;
using CinemaHub.Infrastructure.BackgroundJob;
using Hangfire;

namespace CinemaHub.API.Extensions
{
    public static class MiddlewareExtensions
    {
        public static void UseSwaggerUIWithConfig(this WebApplication app)
        {
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }
        }

        public static void UseHangfireDashboardWithConfig(this WebApplication app)
        {
            app.UseHangfireDashboard("/hangfire");
            using (var scope = app.Services.CreateScope())
            {
                HangfireJobScheduler.RegisterJobs(scope.ServiceProvider);
            }
        }

        public static void UseCustomMiddlewares(this IApplicationBuilder app)
        {
            app.UseMiddleware<LoggingMiddleware>();             // Ghi log request
            app.UseMiddleware<ExceptionHandlingMiddleware>();   // Xử lý exception
            app.UseMiddleware<RateLimitingMiddleware>();        // Giới hạn request

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseCors("MyCors");      // CORS Policy   
        }
    }
}
