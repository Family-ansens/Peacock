using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 公告
    /// </summary>
    public class AnnouncementResDto : BaseResponseDto
    {
        public int Id { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 详情
        /// </summary>
        public string Content { get; set; }
    }
}
