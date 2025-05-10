using Microsoft.Extensions.Caching.Memory;

namespace CinemaHub.API.Middlewares
{
    public class RateLimitingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly int _limit = 1000;
        private readonly TimeSpan _window = TimeSpan.FromSeconds(30);

        public RateLimitingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var ipAddress = context.Connection.RemoteIpAddress?.ToString();
            var cache = context.RequestServices.GetRequiredService<IMemoryCache>();

            if (cache.TryGetValue(ipAddress, out int requestCount))
            {
                if (requestCount >= _limit) // Chỉ cho phép 15 requests / 30s
                {
                    context.Response.StatusCode = StatusCodes.Status429TooManyRequests;
                    await context.Response.WriteAsync("Too many requests. Try again later.");
                    return;
                }
            }

            cache.Set(ipAddress, requestCount + 1, _window);
            await _next(context);
        }
    }

}
