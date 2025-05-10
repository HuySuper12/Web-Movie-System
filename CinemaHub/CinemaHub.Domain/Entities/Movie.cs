using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace CinemaHub.Domain.Entities
{
    public partial class Movie
    {
        public int MovieId { get; set; }

        public string Title { get; set; } = null!;

        public string? Description { get; set; }

        public DateOnly? ReleaseDate { get; set; }

        public int Duration { get; set; }

        public string? Language { get; set; }

        public string? TrailerUrl { get; set; }

        public string Director { get; set; }

        public string? VideoUrl { get; set; }

        public string? Thumbnail { get; set; }

        public string UploadedBy { get; set; }

        public bool? Status { get; set; }

        public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

        public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();

        public virtual Account UploadedByNavigation { get; set; } = null!;

        [JsonIgnore]
        public virtual ICollection<UserFavorite> UserFavorites { get; set; } = new List<UserFavorite>();

        public virtual ICollection<WatchHistory> WatchHistories { get; set; } = new List<WatchHistory>();

        public virtual ICollection<MovieGenre> Genres { get; set; } = new List<MovieGenre>();
    }
}
