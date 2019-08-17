using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 分页查询模型
    /// </summary>
    public class BasePageSearch : BaseSearch
    {
        /// <summary>
        /// 页码，默认为1
        /// </summary>
        public int page { get; set; }
        /// <summary>
        /// 每页大小，默认为10
        /// </summary>
        public int size { get; set; }

        [JsonIgnore]
        public int Skip
        {
            get
            {
                if (size <= 0 || size > 50)
                {
                    size = 10;
                }
                if (page <= 0)
                {
                    page = 1;
                }
                return (page - 1) * size;
            }
        }
    }
}
