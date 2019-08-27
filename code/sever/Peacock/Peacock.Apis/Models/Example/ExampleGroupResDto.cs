using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 应用分组
    /// </summary>
    public class ExampleGroupResDto : BaseResponseDto
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
        /// 应用列表
        /// </summary>
        public List<ExampleResDto> Examples { get; set; }
    }
}
