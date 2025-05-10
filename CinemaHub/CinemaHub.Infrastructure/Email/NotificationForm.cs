using CinemaHub.Application.Interfaces.External;
using CinemaHub.Domain.Entities;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Infrastructure.Email
{
    public class NotificationForm : INotificationForm
    {
        private readonly IConfiguration _configuration;

        public NotificationForm(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public string NotificationAfterCreateMovieForm(string userName, string staffName, string movieTitle)
        {
            var notification = $@"
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src='https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526' alt='MovieHub Logo'  width='150'>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>{userName}</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, {movieTitle}, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don't miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                {staffName} - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>";
            return notification;
        }

        public string NotificationViolationFirst(string userName, string title, string content)
        {
            var accountLockUtilExpirationDays = _configuration["AccountLockUntil:ExpirationDays"];

            var notification = $@"
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src='https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526' alt='MovieHub Logo'  width='150'>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>{userName}</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class='violation'>
                <strong>Comment:</strong> {content}
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>{accountLockUtilExpirationDays} day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>";
            return notification;
        }

        public string RegularNotificationForm(string userName, string staffName, string title, string content)
        {
            var notification = $@"
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src='https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526' alt='MovieHub Logo'  width='150'>
                <h1>{title}</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>{userName}</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> {content}
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                {staffName} - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>";
            return notification;
        }
    }
}
