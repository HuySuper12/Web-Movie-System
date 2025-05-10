using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using FluentResults;
using CinemaHub.API.Models;

namespace CinemaHub.API.Filters
{
    public class CustomValidationFilter : IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext context)
        {
            if (!context.ModelState.IsValid)
            {
                var errors = context.ModelState.Values
                .SelectMany(v => v.Errors)
                .Select(e => e.ErrorMessage)
                .ToList();

                var response = ApiResponse<List<string>>.ErrorResponse(errors.FirstOrDefault(), 400);
                context.Result = new BadRequestObjectResult(response);
            }           
        }

        public void OnActionExecuted(ActionExecutedContext context) { }
    }
}
