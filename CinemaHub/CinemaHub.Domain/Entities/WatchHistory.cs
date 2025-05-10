using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class WatchHistory
    {
        public int HistoryId { get; set; }

        public string UserId { get; set; }

        public int MovieId { get; set; }

        public DateTime? WatchedAt { get; set; }

        public int Progress { get; set; }

        [JsonIgnore]
        public virtual Movie Movie { get; set; } = null!;

        public virtual Account User { get; set; } = null!;
    }
}
