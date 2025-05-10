using Azure.Core;
using CinemaHub.Application.DTOs.Request;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Interfaces.External;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using FluentResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaHub.Application.Services
{
    public class SubscriptionPlanService : ISubscriptionPlanService
    {
        private readonly ISubscriptionPlanRepository _subscriptionPlanRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IPaymentRepository _paymentRepository;
        private readonly IResponseCache _responseCache;
        private readonly IUnitOfWork _unitOfWork;

        public SubscriptionPlanService(ISubscriptionPlanRepository subscriptionPlanRepository, IAccountRepository accountRepository, IPaymentRepository paymentRepository, IUnitOfWork unitOfWork, IResponseCache responseCache)
        {
            _subscriptionPlanRepository = subscriptionPlanRepository;
            _accountRepository = accountRepository;
            _paymentRepository = paymentRepository;
            _unitOfWork = unitOfWork;
            _responseCache = responseCache;
        }


        public async Task<Result<bool>> CheckSubscriptionPlanAfterCreateFromAPIAsync(int subscriptionPlanId, bool status)
        {
            var subscriptionPlan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(subscriptionPlanId);
            if (subscriptionPlan == null)
            {
                return Result.Fail<bool>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }

            subscriptionPlan.IsActive = status;
            _subscriptionPlanRepository.UpdateSubscriptionPlanAsync(subscriptionPlan);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den SubscriptionPlan
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> CreateNewSubscriptionPlanFromAPIAsync(SubscriptionPlanRequest request)
        {
            var subscriptionPlan = new SubscriptionPlan()
            {
                PlanName = request.PlanName,
                Description = request.Description,
                Price = request.Price,
                Duration = request.Duration,
                CreatedAt = DateTime.Now
            };

            _subscriptionPlanRepository.CreateNewSubscriptionPlanAsync(subscriptionPlan);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den SubscriptionPlan
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> RemoveSubscriptionPlanFromAPIAsync(int planId)
        {
            var subscriptionPlan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(planId);
            if (subscriptionPlan == null)
            {
                return Result.Fail<bool>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }

            subscriptionPlan.IsActive = !(subscriptionPlan.IsActive ?? false);
            _subscriptionPlanRepository.UpdateSubscriptionPlanAsync(subscriptionPlan);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den SubscriptionPlan
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            return Result.Ok(true);
        }

        public async Task<Result<bool>> UpdateSubscriptionPlanFromAPIAsync(SubscriptionPlanRequest request)
        {
            var subscriptionPlan = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(request.Id);
            if (subscriptionPlan == null)
            {
                return Result.Fail<bool>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }

            if (request.PlanName == subscriptionPlan.PlanName && request.Duration == subscriptionPlan.Duration && request.Price == subscriptionPlan.Price && request.Description == subscriptionPlan.Description)
            {
                return Result.Fail<bool>(new Error("No changes detected").WithMetadata("StatusCode", 204));
            }

            subscriptionPlan.PlanName = request.PlanName;
            subscriptionPlan.Description = request.Description;
            subscriptionPlan.Price = request.Price;
            subscriptionPlan.Duration = request.Duration;

            _subscriptionPlanRepository.UpdateSubscriptionPlanAsync(subscriptionPlan);
            await _unitOfWork.SaveChangesAsync();

            //Xoa key lien quan den SubscriptionPlan
            await _responseCache.DeleteKeyInRedis("SubscriptionPlan");
            return Result.Ok(true);
        }

        public async Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPendingFromAPIAsync()
        {
            var result = await _subscriptionPlanRepository.ViewAllSubscriptionPendingAsync();
            if (result.Count() == 0)
            {
                return Result.Fail<List<SubscriptionPlan>>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }

        public async Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPlanStatusFromAPIAsync(bool status)
        {
            var result = await _subscriptionPlanRepository.ViewAllSubscriptionPlanStatusAsync(status);
            if (result.Count() == 0)
            {
                return Result.Fail<List<SubscriptionPlan>>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result.OrderBy(p => p.Price).ToList());
        }

        public async Task<Result<List<SubscriptionPlan>>> ViewAllSubscriptionPlanStatusFromAPIAsync(bool status, string email)
        {
            var account = await _accountRepository.ViewProfileByEmailAsync(email);
            if (account == null)
            {
                return Result.Fail<List<SubscriptionPlan>>(new Error("Email not found").WithMetadata("StatusCode", 404));
            }

            var list = await _subscriptionPlanRepository.ViewAllSubscriptionPlanStatusAsync(status);
            if (list.Count() == 0)
            {
                return Result.Fail<List<SubscriptionPlan>>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }

            var check = await _paymentRepository.CheckPaymentFreeTrialAsync(new Payment() { UserId = account.Id });
            if (check)
            {
                var newList = list.Where(plan => plan.PlanName != "Free Trial").ToList();
                return Result.Ok(newList);
            }
            return Result.Ok(list);
        }

        public async Task<Result<SubscriptionPlan>> ViewSubscriptionPlanByIdFromAPIAsync(int plainId)
        {
            var result = await _subscriptionPlanRepository.ViewSubscriptionPlanByIdAsync(plainId);
            if (result == null)
            {
                return Result.Fail<SubscriptionPlan>(new Error("SubscriptionPlan not found").WithMetadata("StatusCode", 404));
            }
            return Result.Ok(result);
        }
    }
}
