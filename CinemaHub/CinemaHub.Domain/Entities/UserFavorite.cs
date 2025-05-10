using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class UserFavorite
    {
        public int FavoriteId { get; set; }

        public string UserId { get; set; }

        public int MovieId { get; set; }

        [JsonIgnore]
        public virtual Movie Movie { get; set; } = null!;

        public virtual Account User { get; set; } = null!;
    }
}
