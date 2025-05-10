using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Rating
    {
        public int RatingId { get; set; }

        public string UserId { get; set; }

        public int MovieId { get; set; }

        public double Rating1 { get; set; }

        public DateTime? CreatedAt { get; set; }

        public bool? Status { get; set; }

        public virtual Movie Movie { get; set; } = null!;

        public virtual Account User { get; set; } = null!;
    }
}
