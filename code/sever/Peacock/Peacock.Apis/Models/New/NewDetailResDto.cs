using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 新闻详情
    /// </summary>
    public class NewDetailResDto : NewResDto
    {
        /// <summary>
        /// 新闻内容
        /// </summary>
        public string Content { get; set; }
    }
}
