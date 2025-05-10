using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Interfaces.Internal
{
    public interface IJobService
    {
        Task EnqueueAutoUnlockAccountCustomerFromAPIAsync();
        Task EnqueueAutoUpdateSubscriptionPlanPendingFromAPIAsync();
        Task EnqueueAutoUpdateMoviePendingFromAPIAsync();
        Task EnqueueSendNotificationAfterCreateMovieFromAPIAsync(int movieId);
        Task EnqueueSendNotificationViolationFirst(Account staffAccount, Account userAccount, Comment commentDetail);
        Task EnqueueSendEmailViolationSecond(Account staffAccount, Account userAccount, Comment commentDetail);
        Task EnqueueSendEmailAfterPayment(Payment payment);
        Task<NotificationViolationResponse> SearchViolationInfomation(NotificationViolationRequest violationRequest);
    }
}
