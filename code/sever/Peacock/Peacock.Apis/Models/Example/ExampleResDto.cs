using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 应用
    /// </summary>
    public class ExampleResDto : BaseResponseDto
    {
        public int Id { get; set; }

        /// <summary>
        /// 商品名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 主图路径
        /// </summary>
        public string ImgUrl { get; set; }
    }

    /// <summary>
    /// 应用详细信息
    /// </summary>
    public class ExampleDetailResDto : ExampleResDto
    {
        /// <summary>
        /// 应用详情
        /// </summary>
        public string Desc { get; set; }

        /// <summary>
        /// 图片列表
        /// </summary>
        public List<string> ImgList { get; set; }
    }
}
