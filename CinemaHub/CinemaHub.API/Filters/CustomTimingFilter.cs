using Microsoft.AspNetCore.Mvc.Filters;

namespace CinemaHub.API.Filters
{
    public class CustomTimingFilter : IAsyncActionFilter
    {
        private readonly ILogger<CustomTimingFilter> _logger;

        public CustomTimingFilter(ILogger<CustomTimingFilter> logger)
        {
            _logger = logger;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var startTime = DateTime.UtcNow;

            // Tiến hành thực thi action method
            var executedContext = await next();

            var endTime = DateTime.UtcNow;
            var duration = endTime - startTime;

            // Ghi lại thời gian thực thi vào log
            _logger.LogInformation($"Action {context.ActionDescriptor.DisplayName} took {duration.TotalMilliseconds} ms to execute.");
        }
    }
}
