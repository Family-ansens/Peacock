using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    public class PageResponseDto<T> where T: BaseResponseDto
    {
        public int count { get; set; }

        public List<T> rows { get; set; }

        public bool success { get; set; }
        public string message { get; set; }
    }
}
