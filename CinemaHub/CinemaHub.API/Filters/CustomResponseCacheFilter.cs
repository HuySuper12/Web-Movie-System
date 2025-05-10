using CinemaHub.Infrastructure.Caching;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using CinemaHub.Application.Interfaces.External;

namespace CinemaHub.API.Filters
{
    public class CustomResponseCacheFilter : Attribute, IAsyncActionFilter
    {
        private readonly int _timeToLiveSeconds;
        private readonly IResponseCache _responseCache;

        public CustomResponseCacheFilter(int timeToLiveSeconds)
        {
            _timeToLiveSeconds = timeToLiveSeconds;
            // Lấy `IResponseCache` từ Service Locator
            var serviceProvider = MyServiceLocator.Instance;
            _responseCache = serviceProvider.GetService<IResponseCache>();
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            // Tạo cacheKey từ request
            var cacheKey = GenerateCacheKeyFromRequest(context.HttpContext.Request);
            // Kiểm tra nếu dữ liệu đã có trong cache
            var cacheResponse = await _responseCache.GetCacheResponseAsync(cacheKey);

            if (!string.IsNullOrEmpty(cacheResponse))
            {
                var contentResult = new ContentResult
                {
                    Content = cacheResponse,
                    ContentType = "application/json",
                    StatusCode = 200
                };

                // Nếu có cache, trả về dữ liệu từ cache
                context.Result = contentResult;
                return;
            }

            // Tiến hành thực thi action method
            var executedContext = await next();

            // Kiểm tra nếu kết quả trả về là OkObjectResult (có dữ liệu)
            if (executedContext.Result is OkObjectResult okObjectResult)
            {
                // Lưu dữ liệu vào cache (ví dụ Redis)
                await _responseCache.SetCacheResponseAsync(cacheKey, okObjectResult.Value, TimeSpan.FromSeconds(_timeToLiveSeconds));
            }
        }

        private string GenerateCacheKeyFromRequest(HttpRequest request)
        {
            var keyBuilder = new StringBuilder();

            keyBuilder.Append($"{request.Path}");

            foreach (var (key, value) in request.Query.OrderBy(x => x.Key))
            {
                keyBuilder.Append($"|{key}-{value}");
            }

            return keyBuilder.ToString();
        }
    }

    public static class MyServiceLocator
    {
        public static IServiceProvider Instance { get; set; }
    }
}
