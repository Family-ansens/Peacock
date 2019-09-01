using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Controllers
{
    /// <summary>
    /// 宣传图
    /// </summary>
    [Route("advertise")]
    public class AdvertiseController : BaseApiController
    {
        public AdvertiseController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
        }

        /// <summary>
        /// 获取走马灯
        /// </summary>
        /// <returns></returns>
        [HttpGet("list")]
        public List<string> Get()
        {
            var list = dbContext.T_Advertise.Where(i => !i.IsDeleted).OrderByDescending(o => o.OrderId).Select(i => i.ImgUrl).ToList();
            return list;
        }
    }
}
