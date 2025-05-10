using CinemaHub.Application.Services;
using CinemaHub.Domain.Entities;
using CinemaHub.Domain.Interfaces;
using CinemaHub.Infrastructure.Persistences;
using CinemaHub.Infrastructure.Persistences.Repositories;
using CinemaHub.API.Filters;
using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Reflection;
using System.Text;
using CinemaHub.Infrastructure.Caching;
using StackExchange.Redis;
using CinemaHub.Application.Commands.Auth;
using CinemaHub.Application.CommandsHandler.Auth;
using CinemaHub.Application.Queries.Account;
using CinemaHub.Application.QueriesHandler.Account;
using CinemaHub.Application.Commands.Account;
using CinemaHub.Application.CommandsHandler.Account;
using System.Security.Claims;
using System.Text.Json;
using Microsoft.Extensions.Options;
using Hangfire;
using CinemaHub.Application.Interfaces.Internal;
using CinemaHub.Infrastructure.BackgroundJob;
using CinemaHub.Application.Interfaces.External;
using Serilog;
using CinemaHub.Infrastructure.Email;
using CinemaHub.Application.DTOs.Response;
using CinemaHub.Application.Commands.MovieGenres;
using CinemaHub.Application.CommandsHandler.MovieGenres;
using CinemaHub.Application.Queries.MovieGenres;
using CinemaHub.Application.QueriesHandler.MovieGenres;
using FluentResults;
using CinemaHub.Application.Queries.Movies;
using CinemaHub.Application.QueriesHandler.Movies;
using CinemaHub.Application.Commands.Movies;
using CinemaHub.Application.CommandsHandler.Movies;
using CinemaHub.Application.Events;
using CinemaHub.Application.EventsHandler;
using CinemaHub.Application.Queries.UserFavorites;
using System.Collections.Generic;
using CinemaHub.Application.QueriesHandler.UserFavorites;
using CinemaHub.Application.Commands.UserFavorites;
using CinemaHub.Application.CommandsHandler.UserFavorites;
using CinemaHub.Application.Queries.Comments;
using CinemaHub.Application.QueriesHandler.Comments;
using CinemaHub.Application.Commands.Comments;
using CinemaHub.Application.CommandsHandler.Comments;
using CinemaHub.Application.Queries.Ratings;
using CinemaHub.Application.QueriesHandler.Ratings;
using CinemaHub.Application.CommandsHandler.Ratings;
using CinemaHub.Application.Commands.Ratings;
using CinemaHub.Application.Queries.Payments;
using CinemaHub.Application.QueriesHandler.Payments;
using CinemaHub.Application.Queries.SubscriptionPlans;
using CinemaHub.Application.QueriesHandler.SubscriptionPlans;
using CinemaHub.Application.Commands.SubscriptionPlans;
using CinemaHub.Application.CommandsHandler.SubscriptionPlans;
using CinemaHub.Application.Queries.Notifications;
using CinemaHub.Application.QueriesHandler.Notifications;
using CinemaHub.Application.Commands.Notifications;
using CinemaHub.Application.CommandsHandler.Notifications;
using CinemaHub.Application.Queries.WatchHistories;
using CinemaHub.Application.QueriesHandler.WatchHistories;
using CinemaHub.Application.Commands.WatchHistories;
using CinemaHub.Application.CommandsHandler.WatchHistories;
using CinemaHub.Infrastructure.Payments.MoMo;
using CinemaHub.Infrastructure.Payments.VNPay;
using CinemaHub.Infrastructure.Payments.PayPal;

namespace CinemaHub.API.Extensions
{
    public static class ServiceExtensions
    {
        public static void ConfigureCors(this IServiceCollection services)
        {
            services.AddCors(p => p.AddPolicy("MyCors", build =>
            {
                //Cho tat ca
                //build.WithOrigins("*").AllowAnyMethod().AllowAnyHeader().AllowCredentials();

                //Gioi han mien
                build.WithOrigins("http://localhost:5173")
                .AllowAnyMethod()  // Cho phép tất cả các phương thức HTTP như GET, POST, PUT, DELETE, v.v.
                .AllowAnyHeader()  // Cho phép tất cả các header nếu cần thiết (ví dụ: Authorization header cho JWT)
                .AllowCredentials(); // Nếu cần gửi cookies hoặc token đi kèm trong yêu cầu
        }));
        }

        public static void ConfigureAuthentication(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
    .AddJwtBearer(options =>
    {

        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = configuration["Jwt:ValidIssuer"],
            ValidAudience = configuration["Jwt:ValidAudience"],
            IssuerSigningKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(configuration["Jwt:Secret"]!))
        };

        options.Events = new JwtBearerEvents
        {
            OnChallenge = context =>
            {
                context.HandleResponse();
                context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                context.Response.ContentType = "application/json";
                return context.Response.WriteAsync(JsonSerializer.Serialize(new
                {
                    error = "Unauthorized",
                    message = "Access denied"
                }));
            },
            OnForbidden = context =>
            {
                context.Response.StatusCode = StatusCodes.Status403Forbidden;
                context.Response.ContentType = "application/json";
                return context.Response.WriteAsync(JsonSerializer.Serialize(new
                {
                    error = "Forbidden",
                    message = "You do not have permission"
                }));
            }
        };
    });

        }

        public static void ConfigureSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(option =>
            {
                option.SwaggerDoc("v1", new OpenApiInfo { Title = "Demo API", Version = "v1" });
                option.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Description = "Please enter a valid token",
                    Name = "Authorization",
                    Type = SecuritySchemeType.Http,
                    BearerFormat = "JWT",
                    Scheme = "Bearer"
                });
                option.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type=ReferenceType.SecurityScheme,
                    Id="Bearer"
                }
            },
            new string[]{}
        }
    });
            });
        }

        public static void ConfigureRedis(this IServiceCollection services, IConfiguration configuration)
        {
            var redisConfig = configuration.GetSection("Redis");
            string redisConnectionString = redisConfig.GetValue<string>("ConnectionString");
            bool redisEnabled = redisConfig.GetValue<bool>("Enable");

            if (redisEnabled)
            {
                // Cấu hình Redis connection
                services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(redisConnectionString));

                // Thêm Redis Cache nếu Redis được bật
                services.AddStackExchangeRedisCache(options =>
                {
                    options.Configuration = redisConnectionString;
                    options.InstanceName = "Redis";
                });
            }
            services.AddScoped<IResponseCache, ResponseCache>();
            MyServiceLocator.Instance = services.BuildServiceProvider();
        }

        public static void ConfigureHangfire(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddHangfire(config =>
            {
                config.UseSqlServerStorage(configuration.GetConnectionString("HangfireConnection"));
            });
            services.AddHangfireServer();// Cấu hình Hangfire Server

            services.AddScoped<IBackgroundJobService, BackgroundJobService>();
            services.AddSingleton<IRecurringJobManager, RecurringJobManager>();
        }

        public static void ConfigureRepositoriesAndServices(this IServiceCollection services)
        {
            //Unit Of Work
            services.AddScoped<IUnitOfWork, UnitOfWork>();

            //Payment
            services.AddScoped<IMoMoService, MoMoService>();
            services.AddScoped<IVNPAYService, VNPAYService>();
            services.AddScoped<IPayPalService, PayPalService>();

            //External Service
            services.AddScoped<IJobService, JobService>();
            services.AddScoped<IEmailService, EmailService>();
            services.AddScoped<IEmailForm, EmailForm>();
            services.AddScoped<INotificationForm, NotificationForm>();
            services.AddScoped<Utils>();


            //DI cho cac Repository va Service
            services.AddScoped<IAuthRepository, AuthRepository>();
            services.AddScoped<IAuthService, AuthService>();

            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IAccountService, AccountService>();

            services.AddScoped<IMovieRepository, MovieRepository>();
            services.AddScoped<IMovieService, MovieService>();

            services.AddScoped<IMovieGenreRepository, MovieGenreRepository>();
            services.AddScoped<IMovieGenreService, MovieGenreService>();

            services.AddScoped<IUserFavoriteRepository, UserFavoriteRepository>();
            services.AddScoped<IUserFavoriteService, UserFavoriteService>();

            services.AddScoped<IWatchHistoryRepository, WatchHistoryRepository>();
            services.AddScoped<IWatchHistoryService, WatchHistoryService>();

            services.AddScoped<INotificationRepository, NotificationRepository>();
            services.AddScoped<INotificationService, NotificationService>();

            services.AddScoped<ICommentRepository, CommentRepository>();
            services.AddScoped<ICommentService, CommentService>();

            services.AddScoped<IRatingRepository, RatingRepository>();
            services.AddScoped<IRatingService, RatingService>();

            services.AddScoped<ISubscriptionPlanRepository, SubscriptionPlanRepository>();
            services.AddScoped<ISubscriptionPlanService, SubscriptionPlanService>();

            services.AddScoped<IPaymentRepository, PaymentRepository>();
            services.AddScoped<IPaymentService, PaymentService>();
        }

        public static void ConfigureFilter(this IServiceCollection services)
        {
            //DI Cho Filter
            services.AddMemoryCache();
            services.AddScoped<CustomResponseCacheFilter>(provider =>
        new CustomResponseCacheFilter(60));
            services.AddScoped<CustomTimingFilter>();
            services.AddScoped<CustomValidationFilter>();
        }

        public static void ConfigureCQRS(this IServiceCollection services)
        {
            //DI Cho CommandHandler
            //Auth
            services.AddScoped<IRequestHandler<SignInCommand, Result<SignInResponse>>, SignInCommandHandler>();
            services.AddScoped<IRequestHandler<SignInGoogleCommand, Result<SignInResponse>>, SignInGoogleCommandHandler>();
            services.AddScoped<IRequestHandler<SignUpStaffCommand, IdentityResult>, SignUpStaffCommandHandler>();
            services.AddScoped<IRequestHandler<SignUpUserCommand, IdentityResult>, SignUpUserCommandHandler>();
            services.AddScoped<IRequestHandler<SendOtpCommand, Result<bool>>, SendOtpCommandHandler>();
            services.AddScoped<IRequestHandler<VerifyOtpCommand, Result<bool>>, VerifyOtpCommandHandler>();
            services.AddScoped<IRequestHandler<ResetPasswordCommand, Result<bool>>, ResetPasswordCommandHandler>();
            services.AddScoped<IRequestHandler<SignOutCommand, Result<bool>>, SignOutCommandHandler>();
            services.AddScoped<IRequestHandler<RenewAccessTokenCommand, Result<string>>, RenewAccessTokenCommandHandler>();

            //Account
            services.AddScoped<IRequestHandler<ViewProfileIdQuery, Result<AccountResponse>>, ViewProfileIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewProfileEmailQuery, Result<AccountResponse>>, ViewProfileEmailQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAccountRoleQuery, Result<List<AccountResponse>>>, ViewAccountRoleQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAccountRolePaginationQuery, Result<List<AccountResponse>>>, ViewAccountRolePaginationQueryHandler>();
            services.AddScoped<IRequestHandler<UpdateAccountCommand, IdentityResult>, UpdateAccountCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveAccountCommand, IdentityResult>, RemoveAccountCommandHandler>();
            services.AddScoped<IRequestHandler<DisableAccountCommand, IdentityResult>, DisableAccountCommandHandler>();

            //MovieGenre
            services.AddScoped<IRequestHandler<GetGenreByIdQuery, Result<MovieGenre>>, GetGenreByIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllGenresQuery, Result<List<MovieGenre>>>, ViewAllGenresQueryHandler>();
            services.AddScoped<IRequestHandler<GetGenreByNameQuery, Result<MovieGenre>>, GetGenreByNameQueryHandler>();
            services.AddScoped<IRequestHandler<CreateGenreCommand, Result<bool>>, CreateGenreCommandHandler>();
            services.AddScoped<IRequestHandler<UpdateGenreCommand, Result<bool>>, UpdateGenreCommandHandler>();
            services.AddScoped<IRequestHandler<DeleteGenreCommand, Result<bool>>, DeleteGenreCommandHandler>();

            //Movie
            services.AddScoped<IRequestHandler<ViewAllMoviesQuery, Result<List<Movie>>>, ViewAllMoviesQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllMoviesPendingQuery, Result<List<Movie>>>, ViewAllMoviesPendingQueryHandler>();
            services.AddScoped<IRequestHandler<ViewMovieByIdQuery, Result<Movie>>, ViewMovieByIdQueryHandler>();
            services.AddScoped<IRequestHandler<SearchMovieByGerneQuery, Result<List<Movie>>>, SearchMovieByGerneQueryHandler>();
            services.AddScoped<IRequestHandler<SearchMovieByLanguageQuery, Result<List<Movie>>>, SearchMovieByLanguageQueryHandler>();
            services.AddScoped<IRequestHandler<GetAllMovieLanguageQuery, Result<List<string>>>, GetAllMovieLanguageQueryHandler>();
            services.AddScoped<IRequestHandler<GetAllMovieYearQuery, Result<List<int>>>, GetAllMovieYearQueryHandler>();
            services.AddScoped<IRequestHandler<FilterGenreAndLanguageAndYearQuery, Result<List<Movie>>>, FilterMovieByGenreAndLanguageAndYearQueryHandler>();
            services.AddScoped<IRequestHandler<SearchMovieTitleQuery, Result<List<Movie>>>, SearchMovieTitleQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllMovieTitleQuery, Result<List<string>>>, ViewAllMovieTitleQueryHandler>();
            services.AddScoped<IRequestHandler<ViewMovieGenreWishCommand, Result<List<string>>>, ViewMovieGenreWishCommandHandler>();
            services.AddScoped<IRequestHandler<CreateMovieCommand, Result<bool>>, CreateMovieCommandHandler>();
            services.AddScoped<IRequestHandler<CheckMovieAfterCreateCommand, Result<bool>>, CheckMovieAfterCreateCommandHandler>();
            services.AddScoped<IRequestHandler<UpdateMovieCommand, Result<bool>>, UpdateMovieCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveMovieCommand, Result<bool>>, RemoveMovieCommandHandler>();

            //Wishlist
            services.AddScoped<IRequestHandler<ViewAllUserFavoritesQuery, Result<List<UserFavorite>>>, ViewAllUserFavoritesQueryHandler>();
            services.AddScoped<IRequestHandler<ViewUserFavoritesByEmailQuery, Result<List<UserFavorite>>>, ViewUserFavoritesByEmailQueryHandler>();
            services.AddScoped<IRequestHandler<GetMovieWishListQuery, Result<List<int>>>, GetMovieWishListQueryHandler>();
            services.AddScoped<IRequestHandler<GetMovieByUserFavoritesQuery, Result<List<Movie>>>, GetMovieByUserFavoritesQueryHandler>();
            services.AddScoped<IRequestHandler<CheckUserFavoriteQuery, Result<bool>>, CheckUserFavoriteQueryHandler>();
            services.AddScoped<IRequestHandler<AddFavoriteCommand, Result<bool>>, AddFavoriteCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveFavoriteCommand, Result<bool>>, RemoveFavoriteCommandHandler>();

            //Comment
            services.AddScoped<IRequestHandler<ViewAllCommentsQuery, Result<List<Comment>>>, ViewAllCommentsQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllCommentByMovieIdQuery, Result<List<Comment>>>, ViewAllCommentByMovieIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewCommentByIdQuery, Result<Comment>>, ViewCommentByIdQueryHandler>();
            services.AddScoped<IRequestHandler<AddCommentCommand, Result<bool>>, AddCommentCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveCommentCommand, Result<bool>>, RemoveCommentCommandHandler>();

            //Rating
            services.AddScoped<IRequestHandler<ViewAllRatingsQuery, Result<List<Rating>>>, ViewAllRatingsQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllRatingByMovieIdQuery, Result<List<Rating>>>, ViewAllRatingByMovieIdQueryHandler>();
            services.AddScoped<IRequestHandler<CalculateRatingAverageQuery, Result<double>>, CalculateRatingAverageQueryHandler>();
            services.AddScoped<IRequestHandler<ViewRatingByIdQuery, Result<Rating>>, ViewRatingByIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewRatingStatisticQuery, Result<List<ViewRatingStatisticResponse>>>, ViewRatingStatisticQueryHandler>();
            services.AddScoped<IRequestHandler<AddRatingCommand, Result<bool>>, AddRatingCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveRatingCommand, Result<bool>>, RemoveRatingCommandHandler>();

            //Payment
            services.AddScoped<IRequestHandler<ViewAllPaymentQuery, Result<List<Payment>>>, ViewAllPaymentQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllPaymentMethodQuery, Result<List<Payment>>>, ViewAllPaymentMethodQueryHandler>();
            services.AddScoped<IRequestHandler<ViewPaymentByIdQuery, Result<Payment>>, ViewPaymentByIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewPaymentByUserIdQuery, Result<List<Payment>>>, ViewPaymentByUserIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewLastedPaymentExpiredQuery, Result<Payment>>, ViewLastedPaymentExpiredQueryHandler>();
            services.AddScoped<IRequestHandler<CheckPaymentFreeTrialQuery, Result<bool>>, CheckPaymentFreeTrialQueryHandler>();
            services.AddScoped<IRequestHandler<GetTotalRevenueQuery, Result<int>>, GetTotalRevenueQueryHandler>();
            services.AddScoped<IRequestHandler<GetStatisticSystemQuery, Result<List<StatisticSystemResponse>>>, GetStatisticSystemQueryHandler>();

            //SubscriptionPlan
            services.AddScoped<IRequestHandler<ViewAllSubscriptionPendingQuery, Result<List<SubscriptionPlan>>>, ViewAllSubscriptionPendingQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllSubscriptionPlanStatusQuery, Result<List<SubscriptionPlan>>>, ViewAllSubscriptionPlanStatusQueryHandler>();
            services.AddScoped<IRequestHandler<ViewSubscriptionPlanByIdQuery, Result<SubscriptionPlan>>, ViewSubscriptionPlanByIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllSubscriptionPlanStatusEmailQuery, Result<List<SubscriptionPlan>>>, ViewAllSubscriptionPlanStatusEmailQueryHandler>();
            services.AddScoped<IRequestHandler<CreateNewSubscriptionPlanCommand, Result<bool>>, CreateNewSubscriptionPlanCommandHandler>();
            services.AddScoped<IRequestHandler<CheckSubscriptionPlanAfterCreateCommand, Result<bool>>, CheckSubscriptionPlanAfterCreateCommandHandler>();
            services.AddScoped<IRequestHandler<UpdateSubscriptionPlanCommand, Result<bool>>, UpdateSubscriptionPlanCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveSubscriptionPlanCommand, Result<bool>>, RemoveSubscriptionPlanCommandHandler>();

            //Notification
            services.AddScoped<IRequestHandler<ViewStaffNotificationQuery, Result<List<Notification>>>, ViewStaffNotificationQueryHandler>();
            services.AddScoped<IRequestHandler<ViewUserNotificationQuery, Result<List<Notification>>>, ViewUserNotificationQueryHandler>();
            services.AddScoped<IRequestHandler<ViewUserNotificationUnReadQuery, Result<List<Notification>>>, ViewUserNotificationUnReadQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllUserNotificationQuery, Result<List<Notification>>>, ViewAllUserNotificationQueryHandler>();
            services.AddScoped<IRequestHandler<CountUserNotificationUnReadQuery, Result<int>>, CountUserNotificationUnReadQueryHandler>();
            services.AddScoped<IRequestHandler<ViewNotificationByIdQuery, Result<Notification>>, ViewNotificationByIdQueryHandler>();
            services.AddScoped<IRequestHandler<AddNotificationCommand, Result<bool>>, AddNotificationCommandHandler>();
            services.AddScoped<IRequestHandler<AddNotificationViolationFirstCommand, Result<bool>>, AddNotificationViolationFirstCommandHandler>();
            services.AddScoped<IRequestHandler<AddNotificationViolationSecondCommand, Result<bool>>, AddNotificationViolationSecondCommandHandler>();
            services.AddScoped<IRequestHandler<UpdateNotificationCommand, Result<bool>>, UpdateNotificationCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveNotificationCommand, Result<bool>>, RemoveNotificationCommandHandler>();

            //WatchHistory
            services.AddScoped<IRequestHandler<CheckUserWatchHistoryQuery, Result<WatchHistory>>, CheckUserWatchHistoryQueryHandler>();
            services.AddScoped<IRequestHandler<UserLastWatchHistoryQuery, Result<WatchHistory>>, UserLastWatchHistoryQueryHandler>();
            services.AddScoped<IRequestHandler<ViewWatchHistoryByIdQuery, Result<WatchHistory>>, ViewWatchHistoryByIdQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllUserWatchHistoryQuery, Result<List<WatchHistory>>>, ViewAllUserWatchHistoryQueryHandler>();
            services.AddScoped<IRequestHandler<ViewUserWatchHistoryByEmailQuery, Result<List<WatchHistory>>>, ViewUserWatchHistoryByEmailQueryHandler>();
            services.AddScoped<IRequestHandler<ViewMovieDetailsInWatchHistoryQuery, Result<List<Movie>>>, ViewMovieDetailsInWatchHistoryQueryHandler>();
            services.AddScoped<IRequestHandler<ViewAllWatchHistoryTodayQuery, Result<int>>, ViewAllWatchHistoryTodayQueryHandler>();
            services.AddScoped<IRequestHandler<AddWatchHistoryCommand, Result<bool>>, AddWatchHistoryCommandHandler>();
            services.AddScoped<IRequestHandler<ContinueWatchHistoryCommand, Result<bool>>, ContinueWatchHistoryCommandHandler>();
            services.AddScoped<IRequestHandler<UpdateWatchHistoryCommand, Result<bool>>, UpdateWatchHistoryCommandHandler>();
            services.AddScoped<IRequestHandler<RemoveWatchHistoryCommand, Result<bool>>, RemoveWatchHistoryCommandHandler>();

            //Event
            services.AddScoped<INotificationHandler<NotificationNewMovieEvent>, NotificationNewMovieEventHandler>();
            services.AddScoped<INotificationHandler<NotificationViolationFirstEvent>, NotificationViolationFirstEventHandler>();
            services.AddScoped<INotificationHandler<NotificationViolationSecondEvent>, NotificationViolationSecondEventHandler>();
            services.AddScoped<INotificationHandler<BillPaymentEvent>, BillPaymentEventHandler>();
        }

        public static void ConfigureLogging(this IHostBuilder hostBuilder)
        {
            Serilog.Log.Logger = new LoggerConfiguration()
    .WriteTo.Console(
        outputTemplate: "{Timestamp:HH:mm:ss} [{Level}] {Message}{NewLine}{Exception}",
        restrictedToMinimumLevel: Serilog.Events.LogEventLevel.Information)
    .WriteTo.File(
        "Logs/Log.txt",
        rollingInterval: RollingInterval.Day,
        retainedFileCountLimit: 10) // ❗Giữ tối đa 10 file log gần nhất
    .MinimumLevel.Information()
    .CreateLogger();

            hostBuilder.UseSerilog();

        }

        public static void ConfigureDatabase(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<CinemaHubContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));
        }

        public static void ConfigureIdentity(this IServiceCollection services)
        {
            services.AddIdentityCore<Account>(options =>
            {
                options.User.RequireUniqueEmail = true;
            })
                .AddRoles<IdentityRole>()
                .AddSignInManager()
                .AddEntityFrameworkStores<CinemaHubContext>()
                .AddDefaultTokenProviders();
        }

        public static void ConfigureMediatR(this IServiceCollection services)
        {
            services.AddMediatR(Assembly.GetExecutingAssembly());
        }
    }
}