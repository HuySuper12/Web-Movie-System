using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Log
    {
        public int LogId { get; set; }

        public string Action { get; set; } = null!;

        public string? UserId { get; set; }

        public DateTime? Timestamp { get; set; }

        public virtual Account? User { get; set; }
    }
}
