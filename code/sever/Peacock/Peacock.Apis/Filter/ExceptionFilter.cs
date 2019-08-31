using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using Peacock.Apis.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Filter
{
    public class ExceptionFilter : IExceptionFilter
    {
        private readonly ILogger _logger;

        public ExceptionFilter(ILogger logger)
        {
            _logger = logger;
        }

        public void OnException(ExceptionContext context)
        {
            var trackingCode = context.HttpContext.TraceIdentifier;
            _logger.LogError(trackingCode, context.Exception);
            context.Result = ExceptionToJson(context.Exception, 500, trackingCode);
            context.ExceptionHandled = true;
        }

        private static JsonResult ExceptionToJson(Exception ex, int statusCode, string trackingCode)
        {
            return new JsonResult(ResponseModel.Error("Error", trackingCode + ":" + ex.Message))
            {
                StatusCode = statusCode
            };
        }
    }
}
