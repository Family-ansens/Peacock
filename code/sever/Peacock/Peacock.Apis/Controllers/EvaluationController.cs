using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Peacock.Apis.Models;
using Peacock.Dal;

namespace Peacock.Apis.Controllers
{
    /// <summary>
    /// 留言
    /// </summary>
    [Route("evaluation")]
    public class EvaluationController : BaseApiController
    {
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="peacockDbContext"></param>
        public EvaluationController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 留言
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost()]
        public StatusCodeResult Create([FromBody]EvaluationResDto model)
        {
            T_Evaluation entity = new T_Evaluation()
            {
                Name = model.Name,
                Tel = model.Tel,
                Email = model.Email,
                IpAddress = string.Empty,
                OtherContact = model.OtherContcat,
                CreatedBy = "-1",
                CreatedTime = DateTime.Now,
                LastUpdatedBy = "-1",
                LastUpdatedTime = DateTime.Now,
            };
            entity.Content = System.Web.HttpUtility.UrlEncode(model.Content);
            dbContext.Add(entity);
            return Ok();
        }

    }
}