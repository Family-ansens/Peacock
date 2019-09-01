using Newtonsoft.Json;
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
        /// 应用简介
        /// </summary>
        public string Introduction { get; set; }

        /// <summary>
        /// 主图路径
        /// </summary>
        public string ImgUrl { get; set; }

        /// <summary>
        /// 分组ID
        /// </summary>
        [JsonIgnore]
        public int GroupId { get; set; }
        /// <summary>
        /// 排序ID
        /// </summary>
        [JsonIgnore]
        public int OrderId { get; set; }
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

        /// <summary>
        /// 相关产品
        /// </summary>
        public List<ExampleProductItem> RelationProducts { get; set; }
    }

    public class ExampleProductItem
    {
        /// <summary>
        /// 商品Id
        /// </summary>
        public int ProductId { get; set; }
        /// <summary>
        /// 商品宣传图
        /// </summary>
        public string ImgUrl { get; set; }
    }
}
