using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    public class NewResDto : BaseResponseDto
    {
        public int ID { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 简介
        /// </summary>
        public string Introduction { get; set; }

        /// <summary>
        /// 宣传图
        /// </summary>
        public string ImgUrl { get; set; }

        /// <summary>
        /// 发布时间
        /// </summary>
        public DateTime? PublishTime { get; set; }
    }
}
