using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class AnnouncementItem
    {
        public int Id { get; set; }

        [Display(Name = "标题(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string TitleZh { get; set; }

        [Display(Name = "标题(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string TitleEn { get; set; }

        [Display(Name = "内容(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ContentZh { get; set; }

        [Display(Name = "内容(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ContentEn { get; set; }
    }
}
