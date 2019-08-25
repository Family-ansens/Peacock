using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class ExampleGroupItem
    {
        public int Id { get; set; }

        [Display(Name = "应用分组名称(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameZh { get; set; }

        [Display(Name = "应用分组名称(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameEn { get; set; }

        [Display(Name = "应用分组编码")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string Code { get; set; }

        [Display(Name = "应用分组序号")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int OrderId { get; set; }
    }
}
