using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class JobService : IJobService
    {

        private readonly IAccountRepository _accountRepository;
        private readonly IMovieRepository _movieRepository;
        private readonly ISubscriptionPlanRepository _subscriptionPlanRepository;
        private readonly ICommentRepository _commentRepository;
        private readonly INotificationRepository _notificationRepository;
        private readonly INotificationForm _notificationForm;
        private readonly IEmailForm _emailForm;
        private readonly IEmailService _emailService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IBackgroundJobClient _backgroundJobClient;
        private readonly IResponseCache _responseCache;

        public JobService(IAccountRepository accountRepository, IMovieRepository movieRepository, ISubscriptionPlanRepository subscriptionPlanRepository, ICommentRepository commentRepository, INotificationRepository notificationRepository, INotificationForm notificationForm, IEmailForm emailForm, IEmailService emailService, IBackgroundJobClient backgroundJobClient, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _accountRepository = accountRepository;
            _movieRepository = movieRepository;
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _commentRepository = commentRepository;
            _notificationRepository = notificationRepository;
            _notificationForm = notificationForm;
            _emailForm = emailForm;
            _emailService = emailService;
            _backgroundJobClient = backgroundJobClient;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task EnqueueAutoUnlockAccountCustomerFromAPIAsync()
        {
            _backgroundJobClient.Enqueue(() => AutoUnlockAccountCustomerFromAPIAsync());
        }

        public async Task AutoUnlockAccountCustomerFromAPIAsync()
        {
            await _accountRepository.AutoUnlockAccountCustomerAsync();
            await _unitOfWork.SaveChangesAsync();
            await Task.Delay(1000);

            await _responseCache.DeleteKeyInRedis("Account");
        }

        public async Task EnqueueAutoUpdateMoviePendingFromAPIAsync()
        {
            _backgroundJobClient.Enqueue(() => AutoUpdateMoviePendingFromAPIAsync());
        }

        public async Task AutoUpdateMoviePendingFromAPIAsync()
        {
            //Xoa key lien quan den Movie
            await _responseCache.DeleteKeyInRedis("Movie");

            var list = new List<Movie>();
            int pageSize = 10;
            string lastMovie = "10000000";
            while (true)
            {
                list = await _movieRepository.ViewAllMoviePendingAsync(pageSize, lastMovie);
                if (list.Count == 0) break;
                foreach (var movie in list)
                {
                    movie.Status = true;
                    _movieRepository.UpdateMovieAsync(movie);
                    await _unitOfWork.SaveChangesAsync();

                    await EnqueueSendNotificationAfterCreateMovieFromAPIAsync(movie.MovieId);
                    await Task.Delay(1000);
                }
                lastMovie = list[list.Count - 1].MovieId.ToString();
            }
        }

        public async Task EnqueueAutoUpdateSubscriptionPlanPendingFromAPIAsync()
        {
            _backgroundJobClient.Enqueue(() => AutoUpdateSubscriptionPlanPendingFromAPIAsync());
        }
        public async Task AutoUpdateSubscriptionPlanPendingFromAPIAsync()
        {
            //Xoa key lien quan den SubscriptionPlan
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");

            var list = await _subscriptionPlanRepository.ViewAllSubscriptionPendingAsync();
            foreach (var subscriptionPlan in list)
            {
                subscriptionPlan.IsActive = true;
                _subscriptionPlanRepository.UpdateSubscriptionPlanAsync(subscriptionPlan);
                await _unitOfWork.SaveChangesAsync();

                await Task.Delay(1000);
            }
        }
        public async Task EnqueueSendEmailAfterPayment(Payment payment)
        {
            _backgroundJobClient.Enqueue(() => SendEmailAfterPayment(payment));
        }

        public async Task SendEmailAfterPayment(Payment payment)
        {

            //Xoa key lien quan den Payment do khi gui mail nay la phuong thuc tich hop vs cac cong thanh toan ben thu 3
            await _responseCache.DeleteKeyInRedis("Payment");

            var account = await _accountRepository.ViewProfileByIdAsync(payment.UserId);
            var subscriptionPlan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(payment.SubscriptionPlanId);

            var mail = _emailForm.PaymentForm(account.FullName, subscriptionPlan.PlanName, payment);

            await _emailService.SendEmailAsync(account.Email, mail.Subject, mail.Body);
        }

        public async Task EnqueueSendEmailViolationSecond(Account staffAccount, Account userAccount, Comment commentDetail)
        {
            _backgroundJobClient.Enqueue(() => SendEmailViolationSecond(staffAccount, userAccount, commentDetail));
        }

        public async Task SendEmailViolationSecond(Account staffAccount, Account userAccount, Comment commentDetail)
        {
            var email = _emailForm.ViolationSecondForm(userAccount.FullName, commentDetail.Content);
            await _emailService.SendEmailAsync(userAccount.Email, email.Subject, email.Body);
        }

        public async Task EnqueueSendNotificationAfterCreateMovieFromAPIAsync(int movieId)
        {
            //Xoa key lien quan den Notification
            await _responseCache.DeleteKeyInRedis("Notification");

            var movie = await _movieRepository.ViewMovieByIdAsync(movieId);

            var account = await _accountRepository.ViewProfileByIdAsync(movie.UploadedBy);
            var userList = await _accountRepository.ViewAccountsByRoleAsync("user");
            foreach (var user in userList)
            {
                var notification = new Notification()
                {
                    UserId = account.Id,
                    ReceiverId = user.Id,
                    Title = "New Movie",
                    ContentDetail = $"Exciting news! A brand-new movie, {movie.Title}, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don't miss out – grab some popcorn and start watching today!",
                    Content = _notificationForm.NotificationAfterCreateMovieForm(user.FullName, account.FullName, movie.Title),
                    CreatedAt = DateTime.Now,
                    Status = false
                };
                _notificationRepository.AddNotificationAsync(notification);
            }
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task EnqueueSendNotificationViolationFirst(Account staffAccount, Account userAccount, Comment commentDetail)
        {
            _backgroundJobClient.Enqueue(() => SendNotificationViolationFirst(staffAccount, userAccount, commentDetail));
        }

        public async Task SendNotificationViolationFirst(Account staffAccount, Account userAccount, Comment commentDetail)
        {
            //Xoa key lien quan den account
            await _responseCache.DeleteKeyInRedis("Notification");

            var notification = new Notification
            {
                UserId = staffAccount.Id,
                ReceiverId = userAccount.Id,
                Title = "Comment Violates Community Standards",
                ContentDetail = $"Warning, the first comment violates user community standards by {userAccount.FullName}",
                Content = _notificationForm.NotificationViolationFirst(userAccount.FullName, "Comment Violates Community Standards", $"Warning, the first comment violates user community standards by {userAccount.FullName}"),
                Status = false,
                CreatedAt = DateTime.Now
            };

            _notificationRepository.AddNotificationAsync(notification);
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task<NotificationViolationResponse> SearchViolationInfomation(NotificationViolationRequest violationRequest)
        {
            var staffAccount = await _accountRepository.ViewProfileByEmailAsync(violationRequest.StaffEmail);
            var userAccount = await _accountRepository.ViewProfileByIdAsync(violationRequest.UserId);
            var commentDetail = await _commentRepository.ViewCommentByIdAsync(violationRequest.CommentId);

            if (staffAccount == null || userAccount == null || commentDetail == null)
            {
                return null;
            }

            return new NotificationViolationResponse
            {
                StaffAccount = staffAccount,
                UserAccount = userAccount,
                CommentDetail = commentDetail
            };
        }
    }
}
