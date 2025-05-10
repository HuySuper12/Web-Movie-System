using Microsoft.Extensions.Caching.Distributed;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using System.Threading.Tasks;
using StackExchange.Redis;
using CinemaHub.Application.Interfaces.External;

namespace CinemaHub.Infrastructure.Caching
{
    public class ResponseCache : IResponseCache
    {
        private IDistributedCache _distributedCache;
        private IConnectionMultiplexer _connectionMultiplexer;

        public ResponseCache(IDistributedCache distributedCache, IConnectionMultiplexer connectionMultiplexer)
        {
            _distributedCache = distributedCache;
            _connectionMultiplexer = connectionMultiplexer;
        }

        public async Task DeleteKeyInRedis(string pattern)
        {
            //Dung connectionMultiplexer de xoa nhieu key cung 1 luc
            //Dung distributed de xoa cac 1 key duy nhat
            var server = _connectionMultiplexer.GetServer("127.0.0.1", 6379);
            var db = _connectionMultiplexer.GetDatabase();

            // Tìm và xóa key theo pattern
            var keys = server.Keys(pattern: $"Redis/api/{pattern}/*").ToArray();
            foreach (var key in keys)
            {
                await db.KeyDeleteAsync(key);
            }
        }

        public async Task<string> GetCacheResponseAsync(string cachekey)
        {
            var cacheResponse = await _distributedCache.GetStringAsync(cachekey);

            return string.IsNullOrEmpty(cacheResponse) ? null : cacheResponse;
        }

        public async Task SetCacheResponseAsync(string cachekey, object response, TimeSpan timeToLive)
        {
            if (response == null)
            {
                return;
            }
            //Chu thich:
            // - JsonConvert.SerializeObject: Dua ve doi tuong json quet tham chieu vong lap (Giup tranh vong lap tham chieu - cau hinh trong program.cs) (Do minh dung JsonIgnore)
            // - JsonSerializer.Serialize: Chuyển đổi dữ liệu thành chuỗi JSON dang System.Text.Json (Cho toc do nhanh hon so voi Newtonsoft.Json) 

            // Chuyển đổi dữ liệu thành chuỗi JSON, sử dụng camelCase cho các thuộc tính
            var dataToCache = JsonSerializer.Serialize(response, new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase,  // Sử dụng camelCase cho các thuộc tính
                WriteIndented = true,                               // Nếu bạn muốn kết quả JSON dễ đọc (có thụt lề)
                ReferenceHandler = ReferenceHandler.IgnoreCycles    // Nếu bạn muốn bỏ qua vòng lặp tham chiếu (giống như JsonIgnore)
            });

            await _distributedCache.SetStringAsync(cachekey, dataToCache, new DistributedCacheEntryOptions()
            {
                AbsoluteExpirationRelativeToNow = timeToLive
            });
        }
    }
}
