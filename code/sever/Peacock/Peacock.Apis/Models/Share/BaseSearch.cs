using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    public class BaseSearch
    {
        /// <summary>
        /// 语言，只允许传入 Chinese 或 English
        /// </summary>
        public string language { get; set; }
    }
}
