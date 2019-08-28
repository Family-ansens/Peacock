using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Models
{
    /// <summary>
    /// 留言
    /// </summary>
    public class EvaluationResDto
    {
        /// <summary>
        /// 姓名
        /// </summary>
        [Required]
        public string Name { get; set; }
        /// <summary>
        /// 电话
        /// </summary>
        [Required]
        public string Tel { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        [Required]
        public string Content { get; set; }
        /// <summary>
        /// 邮箱
        /// </summary>
        [Required]
        public string Email { get; set; }
        /// <summary>
        /// 其他联系方式
        /// </summary>
        public string OtherContcat { get; set; }
    }
}
