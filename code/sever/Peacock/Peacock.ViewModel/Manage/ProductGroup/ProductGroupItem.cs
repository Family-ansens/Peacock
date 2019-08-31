using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage.ProductGroup
{
    public class ProductGroupItem
    {
        public int Id { get; set; }

        [Display(Name = "商品分组名称(中文)")]
        [Required(ErrorMessage ="{0}为必填项")]
        public string NameZh { get; set; }

        [Display(Name = "商品分组名称(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameEn { get; set; }

        [Display(Name = "商品分组编码")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string Code { get; set; }

        [Display(Name = "商品分组序号")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int OrderId { get; set; }
        //[Display(Name = "详细说明(中文)")]
        //public string DescriptionZh { get; set; }
        //[Display(Name = "详细说明(英文)")]
        //public string DescriptionEn { get; set; }
    }
}
