using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Domain.Entities;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace CinemaHub.Infrastructure.Email
{
    public class EmailForm : IEmailForm
    {
        private readonly IConfiguration _configuration;

        public EmailForm(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public EmailResponse OtpForm(Account user, string otp)
        {
            var otpExpiration = _configuration["OtpSettings:ExpirationMinutes"];

            string subject = "MovieHub - Secure Your Access";

            string body = $@"
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <style>
        body {{
            font-family: Arial, sans-serif;
            color: #333333;
            background-color: #f9f9f9;
            padding: 20px;
            margin: 0;
        }}
        .container {{
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }}
        .header {{
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }}
        .header img {{
            max-width: 150px;
        }}
        .otp {{
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50;
            text-align: center;
            margin: 20px 0;
        }}
        .footer {{
            font-size: 12px;
            color: #777777;
            text-align: center;
            margin-top: 20px;
        }}
    </style>
</head>
<body>
    <div class='container'>
        <div class='header'>
            <img src='https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526' alt='YourAppName Logo'>
            <h1>Secure Access Notification</h1>
        </div>
        <p>Hi <strong>{user.FullName}</strong>,</p>
        <p>We noticed a request to access your account. To proceed, please use the following One-Time Password (OTP):</p>
        <div class='otp'>{otp}</div>
        <p>This OTP is valid for the next <strong>{otpExpiration} minute(s)</strong>. Please keep it confidential and do not share it with anyone.</p>
        <p>If you did not request this code, please send message to our email immediately.</p>
        <p>Thank you for trusting <strong>Movie Hub</strong>.</p>
        <div class='footer'>
            <p>&copy; 2024 Movie Hub. All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>";
            return new EmailResponse() { Subject = subject, Body = body };
        }

        public EmailResponse PaymentForm(string fullName, string subscriptionPlanName, Payment payment)
        {
            string subject = "MovieHub - Your invoice information";
            string body = $@"<!DOCTYPE html>
<html>
<head>
    <style>
        body {{
            font-family: Arial, sans-serif;
        }}
        .header {{
            text-align: center;
            border-bottom: 2px solid #FF6F61;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }}
        .header img {{
            max-width: 150px;
        }}
        .header h1 {{
            color: #FF6F61;
            font-size: 22px;
            margin: 10px 0;
        }}
        .invoice-box {{
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
        }}
        .invoice-box table {{
            width: 100%;
            line-height: inherit;
            text-align: left;
        }}
        .invoice-box table td {{
            padding: 5px;
            padding-left: 30px;
            vertical-align: top;
        }}
        .invoice-box table tr td:nth-child(2) {{
            text-align: right;
        }}
        .invoice-header {{
            font-size: 18px;
            font-weight: bold;
        }}
        .total {{
            font-weight: bold;
        }}
    </style>
</head>
<body>
    <div class=""invoice-box"">
        <div class=""header"">           
            <img src=""https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526"" alt=""Platform Logo"">
            <h1>Movie Hub Invoice</h1>
        </div>
        <center> 
            <p>Thank you for your purchase!</p>
        </center>
        <table>
            <tr>
                <td>Customer Name:</td>
                <td>{fullName}</td>
            </tr>
            <tr>
                <td>Payment Code:</td>
                <td>{payment.PaymentCode}</td>
            </tr>
            <tr>
                <td>Payment Method:</td>
                <td>{payment.PaymentMethod}</td>
            </tr>
            <tr>
                <td>Subscription Package:</td>
                <td>{subscriptionPlanName}</td>
            </tr>
            <tr>
                <td>Payment Date:</td>
                <td>{payment.PaymentDate?.ToString("dd/MM/yyyy HH:mm")}</td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td>{payment.Amount.ToString("N0")} VND</td>
            </tr>
            <tr>
                <td>Expired Date:</td>
                <td>{payment.ExpiryDate.ToString("dd/MM/yyyy HH:mm")}</td>
            </tr>
        </table>
        <center>
            <p class=""total"">Total Paid: {payment.Amount.ToString("N0")} VND</p> 
        </center>
    </div>
</body>
</html>
";
            return new EmailResponse() { Subject = subject, Body = body };
        }

        public EmailResponse ViolationSecondForm(string fullName, string content)
        {
            var accountLockUtilExpirationDays = _configuration["AccountLockUntil:ExpirationDays"];

            string subject = "MovieHub - Temporarily disabled account";
            string body = @$"
<!DOCTYPE html>
<html lang=""en"">
<head>
    <meta charset=""UTF-8"">
    <meta name=""viewport"" content=""width=device-width, initial-scale=1.0"">
    <title>Community Standards Violation</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            color: #333333;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }}
        .container {{
            max-width: 600px;
            margin: 30px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }}
        .header {{
            text-align: center;
            border-bottom: 2px solid #FF6F61;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }}
        .header img {{
            max-width: 150px;
        }}
        .header h1 {{
            color: #FF6F61;
            font-size: 22px;
            margin: 10px 0;
        }}
        .content p {{
            line-height: 1.6;
            margin: 10px 0;
        }}
        .comment-box {{
            background-color: #f9f9f9;
            border-left: 4px solid #FF6F61;
            padding: 10px;
            margin: 20px 0;
            font-style: italic;
            color: #555555;
        }}
        .actions {{
            background-color: #fff3e0;
            padding: 10px;
            border-radius: 5px;
            margin: 20px 0;
        }}
        .footer {{
            font-size: 12px;
            color: #777777;
            text-align: center;
            margin-top: 20px;
            border-top: 1px solid #e6e6e6;
            padding-top: 10px;
        }}
        .button {{
            display: inline-block;
            background-color: #FF6F61;
            color: #ffffff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
            margin: 20px auto;
            display: block;
            max-width: 200px;
        }}
    </style>
</head>
<body>
    <div class=""container"">
        <div class=""header"">
            <img src=""https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526"" alt=""Platform Logo"">
            <h1>Community Standards Violation</h1>
        </div>
        <div class=""content"">
            <p>Dear <strong>{fullName}</strong>,</p>
            <p>We regret to inform you that one of your recent comments has violated our <strong>Community Standards</strong> and has been removed from our platform.</p>
            <p>Below is the content of the comment in question:</p>
            <div class=""comment-box"">
                ""{content}""
            </div>
            <p>The violation pertains to one or more of the following reasons:</p>
            <ul>
                <li>Inappropriate language</li>
                <li>Offensive or personal attacks</li>
                <li>Spam or advertising</li>
                <li>Misinformation</li>
                <li>Irrelevant content</li>
            </ul>
            <div class=""actions"">
                <p><strong>Important Notice:</strong></p>
                <p>This is the <strong>second time</strong> you have violated our Community Standards. As a result, we have taken the following actions:</p>
                <ul>
                    <li>Your comment has been removed.</li>
                    <li>Your account has been temporarily locked until {accountLockUtilExpirationDays} days.<strong></strong></li>
                </ul>
            </div>
            <p>If you believe this action was taken in error or have any questions, please contact us at <a href=""mailto:support@moviehub.com"">support@moviehub.com</a>.</p>
        </div>
        <div class=""footer"">
            <p>&copy; 2024 Movie Hub. All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>
";
            return new EmailResponse() { Subject = subject, Body = body };
        }
    }
}
