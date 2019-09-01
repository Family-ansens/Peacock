using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class EvaluationItem
    {
        public int Id { get; set; }
        [DisplayName("真名")]
        public string Name { get; set; }
        [DisplayName("电话")]
        public string Tel { get; set; }
        [DisplayName("留言")]
        public string Content { get; set; }
        [DisplayName("邮箱")]
        public string Email { get; set; }

        [DisplayName("其他联系方式")]
        public string OtherContact { get; set; }

        [DisplayName("ip地址")]
        public string IpAddress { get; set; }

        [DisplayName("留言时间")]
        public DateTime CreatedTime { get; set; }
    }
}
