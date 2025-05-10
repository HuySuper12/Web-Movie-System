using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Response
{
    public class StatisticSystemResponse
    {
        public string? Name { get; set; }
        public decimal? TotalView { get; set; }
        public decimal? TotalRevenue { get; set; }
    }
}
