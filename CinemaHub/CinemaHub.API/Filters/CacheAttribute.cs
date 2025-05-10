using Microsoft.AspNetCore.Mvc;

namespace CinemaHub.API.Filters
{
    public class CacheAttribute : TypeFilterAttribute
    {
        public CacheAttribute(int timeToLiveSeconds)
            : base(typeof(CustomResponseCacheFilter))
        {
            Arguments = new object[] { timeToLiveSeconds };
        }
    }
}
