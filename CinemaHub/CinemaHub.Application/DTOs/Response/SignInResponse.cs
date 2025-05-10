using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.DTOs.Response
{
    public class SignInResponse
    {
        public string AccessToken { get; set; }

        public string RefreshToken { get; set; }
    }
}
