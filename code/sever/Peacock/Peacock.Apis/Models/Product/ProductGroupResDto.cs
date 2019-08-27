using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 商品分组
    /// </summary>
    public class ProductGroupResDto : BaseResponseDto
    {
        /// <summary>
        /// id
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 编码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 商品列表
        /// </summary>
        public List<ProductResDto> Products { get; set; }
    }
}
