using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 商品简称
    /// </summary>
    public class ProductResDto : BaseResponseDto
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

    public class ProductDetailResDto : ProductResDto
    {
        /// <summary>
        /// 商品详情
        /// </summary>
        public string Desc { get; set; }

        /// <summary>
        /// 图片列表
        /// </summary>
        public List<string> ImgList { get; set; }
    }
}
