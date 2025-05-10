using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Response
{
    public class ViewRatingStatisticResponse
    {
        public int Id { get; set; }
        public string Thumbnail { get; set; }

        public string Title { get; set; }

        public string Director { get; set; }

        public double AverageRating { get; set; }

        public int TotalRatings { get; set; }

        public int TotalViews { get; set; }
    }
}
