using MailKit.Security;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MailKit.Net.Smtp; //Thu vien mail
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CinemaHub.Application.Interfaces.External;

namespace CinemaHub.Infrastructure.Email
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task SendEmailAsync(string toEmail, string subject, string message)
        {
            var senderName = _configuration["SmtpSettings:SenderName"];
            var senderEmail = _configuration["SmtpSettings:SenderEmail"];
            var server = _configuration["SmtpSettings:Server"];
            var port = _configuration["SmtpSettings:Port"];
            var userName = _configuration["SmtpSettings:Username"];
            var password = _configuration["SmtpSettings:Password"];

            var emailMessage = new MimeMessage();
            emailMessage.From.Add(new MailboxAddress(senderName, senderEmail));
            emailMessage.To.Add(new MailboxAddress("", toEmail));
            emailMessage.Subject = subject;
            var body = new BodyBuilder()
            {
                HtmlBody = message
            };
            emailMessage.Body = body.ToMessageBody();

            using (var client = new SmtpClient())
            {
                await client.ConnectAsync(server, int.Parse(port), SecureSocketOptions.StartTls);
                await client.AuthenticateAsync(userName, password);
                await client.SendAsync(emailMessage);
                await client.DisconnectAsync(true);
            }
        }
    }
}
