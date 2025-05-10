
using CinemaHub.API.Middlewares;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using Microsoft.AspNetCore.Identity;
using System.Security.Principal;
using Microsoft.EntityFrameworkCore;
using CinemaHub.Infrastructure.Persistences;
using CinemaHub.Domain.Entities;
using CinemaHub.API.Extensions;
using System.Security.Claims;

namespace CinemaHub.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            IConfiguration configuration = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();

            // Add services to the container.
            //Cau hinh Json binh thuong
            builder.Services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
                options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
            });

            builder.Services.ConfigureCors();

            builder.Services.ConfigureAuthentication(configuration);

            builder.Services.ConfigureSwagger();                
            
            builder.Services.ConfigureHangfire(configuration);

            builder.Host.ConfigureLogging();                    
            
            builder.Services.ConfigureDatabase(configuration);

            builder.Services.AddEndpointsApiExplorer();

            builder.Services.ConfigureIdentity();

            builder.Services.ConfigureRepositoriesAndServices();   
            
            builder.Services.ConfigureMediatR();                  
            
            builder.Services.ConfigureCQRS();                    
            
            builder.Services.ConfigureFilter();                   
            
            builder.Services.ConfigureRedis(configuration);              


            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            app.UseSwaggerUIWithConfig(); 

            app.UseHttpsRedirection();

            app.UseCustomMiddlewares();

            app.UseHangfireDashboardWithConfig();

            app.MapControllers();

            app.Run();
        }
    }
}
