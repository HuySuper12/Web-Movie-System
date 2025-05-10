using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class MovieGenre
    {
        public int GenreId { get; set; }

        public string GenreName { get; set; } = null!;

        [JsonIgnore] // Loại bỏ thuộc tính không cần thiết
        public virtual ICollection<Movie> Movies { get; set; } = new List<Movie>();

    }
}
