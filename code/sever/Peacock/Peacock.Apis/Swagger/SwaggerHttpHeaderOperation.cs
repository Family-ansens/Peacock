using Microsoft.AspNetCore.Authorization;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Peacock.Apis.Swagger
{
    /// <summary>
    /// 支持在swagger提交Auth Token
    /// </summary>
    public class SwaggerHttpHeaderOperation : IOperationFilter
    {
        /// <summary>
        /// 生成swagger前端界面时，如果actoin上拥有Authorize或TmsAuthorize属性，则生成Authorization Header提交控件
        /// </summary>
        /// <param name="operation"></param>
        /// <param name="context"></param>
        public void Apply(Operation operation, OperationFilterContext context)
        {
            if (operation.Parameters == null)
            {
                operation.Parameters = new List<IParameter>();
            }

            MethodInfo methodInfo;
            context.ApiDescription.TryGetMethodInfo(out methodInfo);
            var isAuthorized = methodInfo.CustomAttributes.Any(a => a.AttributeType == typeof(AuthorizeAttribute));

            //提供action都没有权限特性标记，检查控制器有没有
            if (isAuthorized == false)
            {
                isAuthorized = methodInfo.DeclaringType.CustomAttributes.Any(a => a.AttributeType == typeof(AuthorizeAttribute));
            }

            var isAllowAnonymous = methodInfo.CustomAttributes.Any(a => a.AttributeType == typeof(AllowAnonymousAttribute));

            if (isAuthorized && isAllowAnonymous == false)
            {
                operation.Parameters.Add(new NonBodyParameter()
                {
                    Name = "Authorization",  //添加Authorization头部参数
                    In = "header",
                    Type = "string",
                    Required = false
                });
            }
        }
    }
}
