using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class ProductItem
    {
        public int Id { get; set; }

        [Display(Name = "商品名称(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameZh { get; set; }

        [Display(Name = "商品名称(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameEn { get; set; }

        [Display(Name = "商品分组序号")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int OrderId { get; set; }

        public string DescriptionZh { get; set; }

        public string DescriptionEn { get; set; }

        [Display(Name = "商品分组")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string GroupId { get; set; }

        public IEnumerable<SelectListItem> GroupSelectList { get; set; }
    }
}
