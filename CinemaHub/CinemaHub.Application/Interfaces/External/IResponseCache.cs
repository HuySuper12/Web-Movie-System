using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.External
{
    public interface IResponseCache
    {
        Task SetCacheResponseAsync(string cachekey, object response, TimeSpan timeToLive);
        Task<string> GetCacheResponseAsync(string cachekey);
        Task DeleteKeyInRedis(string pattern);
    }
}
