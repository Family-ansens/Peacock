using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 应用列表查询model
    /// </summary>
    public class ExamplePageSearch : BasePageSearch
    {
        /// <summary>
        /// 搜索字段，模糊搜索
        /// </summary>
        public string Query { get; set; }
    }
}
