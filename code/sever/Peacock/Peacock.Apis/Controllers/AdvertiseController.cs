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
        /// 获取宣传图列表
        /// </summary>
        /// <returns></returns>
        [HttpGet("list")]
        public List<string> Get()
        {
            string path = "/file/img/SAM_1040.JPG";
            return new List<string>() { path, path, path, path, path };
        }
    }
}
