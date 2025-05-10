using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class NotificationService : INotificationService
    {
        private readonly INotificationRepository _notificationRepository;
        private readonly INotificationForm _notificationForm;
        private readonly IAccountRepository _accountRepository;
        private readonly ICommentRepository _commentRepository;
        private readonly IRatingRepository _ratingRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IResponseCache _responseCache;
        private readonly IConfiguration _configuration;

        public NotificationService(INotificationRepository notificationRepository, INotificationForm notificationForm, IAccountRepository accountRepository, ICommentRepository commentRepository, IRatingRepository ratingRepository, IConfiguration configuration, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _notificationRepository = notificationRepository;
            _notificationForm = notificationForm;
            _accountRepository = accountRepository;
            _commentRepository = commentRepository;
            _ratingRepository = ratingRepository;
            _configuration = configuration;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }

        public async Task<Result<bool>> AddNotificationFromAPIAsync(NotificationRequest notificationRequest)
        {
            var staffAccount = await _accountRepository.ViewProfileByEmailAsync(notificationRequest.StaffEmail);
            if (staffAccount == null)
            {
                return Result.Fail<bool>(new Error("Account Staff not found").WithMetadata("StatusCode", 404));
            }

            if (notificationRequest.ReceiverEmail == "all")
            {
                //add notification to all user
                var receiverAccount = await _accountRepository.ViewAccountsByRoleAsync("user");

                if (receiverAccount.Count == 0)
                {
                    return Result.Fail<bool>(new Error("Account User not found").WithMetadata("StatusCode", 404));
                }

                foreach (var user in receiverAccount)
                {
                    var allNotification = new Notification
                    {
                        UserId = staffAccount.Id,
                        ReceiverId = user.Id,
                        Title = notificationRequest.Title,
                        ContentDetail = notificationRequest.Content,
                        Content = _notificationForm.RegularNotificationForm(user.FullName, staffAccount.FullName, notificationRequest.Title, notificationRequest.Content),
                        Status = false,
                        CreatedAt = DateTime.Now
                    };
                    _notificationRepository.AddNotificationAsync(allNotification);
                }
                await _unitOfWork.SaveChangesAsync();

                //Xoa key lien quan den Notification
                await _responseCache.DeleteKeyInRedis("Notification");
                return Result.Ok(true);
            }

            //add specifically notification
            var userAccount = await _accountRepository.ViewProfileByEmailAsync(notificationRequest.ReceiverEmail);
            if (userAccount == null)
            {
                return Result.Fail<bool>(new Error("Account User not found").WithMetadata("StatusCode", 404));
            }

            var notification = new Notification
            {
                UserId = staffAccount.Id,
                ReceiverId = userAccount.Id,
                Title = notificationRequest.Title,
                ContentDetail = notificationRequest.Content,
                Content = _notificationForm.RegularNotificationForm(userAccount.FullName, staffAccount.FullName, notificationRequest.Title, notificationRequest.Content),
                Status = false,
                CreatedAt = DateTime.Now
            };
            _notificationRepository.AddNotificationAsync(notification);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den Notification
            await _responseCache.DeleteKeyInRedis("Notification");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> AddNotificationViolationFirst(NotificationViolationRequest violationRequest)
        {
            var staffAccount = await _accountRepository.ViewProfileByEmailAsync(violationRequest.StaffEmail);
            if (staffAccount == null)
            {
                return Result.Fail<bool>(new Error("Account Staff not found").WithMetadata("StatusCode", 404));
            }
            var userAccount = await _accountRepository.ViewProfileByIdAsync(violationRequest.UserId);
            if (userAccount == null)
            {
                return Result.Fail<bool>(new Error("Account User not found").WithMetadata("StatusCode", 404));
            }

            var commentDetail = await _commentRepository.ViewCommentByIdAsync(violationRequest.CommentId);
            if (commentDetail == null)
            {
                return Result.Fail<bool>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }

            var ratingDetail = await _ratingRepository.ViewRatingByIdAsync(violationRequest.CommentId);
            if (ratingDetail == null)
            {
                return Result.Fail<bool>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }

            //Cho comment se khong xuat hien nguoi dung xem
            commentDetail.Status = false;
            _commentRepository.RemoveCommentAsync(commentDetail);

            //Cho rating se khong xuat hien nguoi dung xem
            ratingDetail.Status = false;
            _ratingRepository.RemoveRatingAsync(ratingDetail);

            //Cap nhat vi pham loi
            userAccount.ViolationCount = 1;
            _accountRepository.UpdateAccountAsync(userAccount);

            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("Notification");
            await _responseCache.DeleteKeyInRedis("Comment");
            await _responseCache.DeleteKeyInRedis("Rating");
            await _responseCache.DeleteKeyInRedis("Account");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> AddNotificationViolationSecond(NotificationViolationRequest violationRequest)
        {
            var staffAccount = await _accountRepository.ViewProfileByEmailAsync(violationRequest.StaffEmail);
            if (staffAccount == null)
            {
                return Result.Fail<bool>(new Error("Account Staff not found").WithMetadata("StatusCode", 404));
            }
            var userAccount = await _accountRepository.ViewProfileByIdAsync(violationRequest.UserId);
            if (userAccount == null)
            {
                return Result.Fail<bool>(new Error("Account User not found").WithMetadata("StatusCode", 404));
            }

            var commentDetail = await _commentRepository.ViewCommentByIdAsync(violationRequest.CommentId);
            if (commentDetail == null)
            {
                return Result.Fail<bool>(new Error("Comment not found").WithMetadata("StatusCode", 404));
            }

            var ratingDetail = await _ratingRepository.ViewRatingByIdAsync(violationRequest.CommentId);
            if (ratingDetail == null)
            {
                return Result.Fail<bool>(new Error("Rating not found").WithMetadata("StatusCode", 404));
            }

            //Cho comment se khong xuat hien nguoi dung xem
            commentDetail.Status = false;
            _commentRepository.RemoveCommentAsync(commentDetail);

            //Cho rating se khong xuat hien nguoi dung xem
            ratingDetail.Status = false;
            _ratingRepository.RemoveRatingAsync(ratingDetail);

            //Cap nhat vi pham
            var accountLockUtilExpirationDays = _configuration["AccountLockUntil:ExpirationDays"];
            userAccount.ViolationCount = 2;
            userAccount.AccountLockUntil = DateTime.Now.AddDays(int.Parse(accountLockUtilExpirationDays));
            userAccount.Status = false;
            _accountRepository.UpdateAccountAsync(userAccount);

            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("Comment");
            await _responseCache.DeleteKeyInRedis("Rating");
            await _responseCache.DeleteKeyInRedis("Account");
            return Result.Ok(true);
        }

        public async Task<Result<int>> CountUserNotificationUnReadFromAPIAsync(string email)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<int>(new Error("Email not found").WithMetadata("StatusCode", 404));
            }

            var result = await _notificationRepository.CountUserNotificationUnReadAsync(account.Id);
            return Result.Ok(result);
        }

        public async Task<Result<bool>> RemoveNotificationFromAPIAsync(int notificationId)
        {
            var searchNotification = await _notificationRepository.ViewNotificationByIdAsync(notificationId);

            if (searchNotification == null)
            {
                return Result.Fail<bool>(new Error("notification not found").WithMetadata("StatusCode", 404));
            }

            _notificationRepository.RemoveNotificationAsync(searchNotification);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("Notification");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> UpdateNotificationFromAPIAsync(int notificationId)
        {
            var searchNotification = await _notificationRepository.ViewNotificationByIdAsync(notificationId);

            if (searchNotification == null)
            {
                return Result.Fail<bool>(new Error("notification not found").WithMetadata("StatusCode", 404));
            }

            searchNotification.Status = true;
            _notificationRepository.UpdateNotificationAsync(searchNotification);
            await _unitOfWork.SaveChangesAsync();

            await _responseCache.DeleteKeyInRedis("Notification");
            return Result.Ok(true);
        }

        public async Task<Result<List<Notification>>> ViewAllUserNotificationFromAPIAsync(int pageSize, string notificationId)
        {
            var result = await _notificationRepository.ViewAllUserNotificationAsync(pageSize, notificationId);
            if (result.Count() == 0)
            {
                return Result.Fail<List<Notification>>(new Error("Notification not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<Notification>> ViewNotificationByIdFromAPIAsync(int notificationId)
        {
            var result = await _notificationRepository.ViewNotificationByIdAsync(notificationId);
            if (result == null)
            {
                return Result.Fail<Notification>(new Error("Notification not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Notification>>> ViewStaffNotificationFromAPIAsync(string email, int pageSize, string notificationId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Notification>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _notificationRepository.ViewStaffNotificationAsync(account.Id, pageSize, notificationId);
            if (result.Count() == 0)
            {
                return Result.Fail<List<Notification>>(new Error("Notification not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Notification>>> ViewUserNotificationFromAPIAsync(string email, int pageSize, string notificationId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Notification>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _notificationRepository.ViewUserNotificationAsync(account.Id, pageSize, notificationId);
            if (result.Count() == 0)
            {
                return Result.Fail<List<Notification>>(new Error("Notification not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<Notification>>> ViewUserNotificationUnReadFromAPIAsync(string email, int pageSize, string notificationId)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<Notification>>(new Error("Account not found").WithMetadata("StatusCode", 404));
            }

            var result = await _notificationRepository.ViewUserNotificationUnReadAsync(account.Id, pageSize, notificationId);
            if (result.Count() == 0)
            {
                return Result.Fail<List<Notification>>(new Error("Notification not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
