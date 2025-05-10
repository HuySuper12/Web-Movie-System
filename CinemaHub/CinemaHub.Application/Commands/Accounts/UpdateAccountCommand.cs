using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Commands.Account
{
    public class UpdateAccountCommand : IRequest<IdentityResult>
    {
        public string Email { get; set; } = null!;
        public string FullName { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public string PictureUrl { get; set; } = null!;

        public UpdateAccountCommand(string email, string fullName, string phoneNumber, string pictureUrl)
        {
            Email = email;
            FullName = fullName;
            PhoneNumber = phoneNumber;
            PictureUrl = pictureUrl;
        }
    }
}
