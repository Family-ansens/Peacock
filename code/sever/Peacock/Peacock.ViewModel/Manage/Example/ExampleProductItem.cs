using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class ExampleProductItem
    {
        public int Id { get; set; }

        public int ExampleId { get; set; }

        [Display(Name = "商品")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int ProductId { get; set; }

        [Display(Name = "商品名称")]
        public string ProductName { get; set; }

        [Display(Name = "商品主图")]
        public string ProductImgPath { get; set; }

        public IEnumerable<SelectListItem> ProductSelectList { get; set; }

        public Dictionary<string, string> ProductImgDict { get; set; }
    }
}
