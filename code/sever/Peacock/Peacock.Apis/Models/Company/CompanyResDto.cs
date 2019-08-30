using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 公司
    /// </summary>
    public class CompanyResDto : BaseResponseDto
    {
        public int Id { get; set; }
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 简介
        /// </summary>
        public string Introduction { get; set; }
        /// <summary>
        /// 详情
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 宣传图
        /// </summary>
        public string Img { get; set; }
    }
}
