using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class ExampleItem
    {
        public int Id { get; set; }

        [Display(Name = "应用名称(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameZh { get; set; }

        [Display(Name = "应用名称(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string NameEn { get; set; }

        [Display(Name = "应用分组序号")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int OrderId { get; set; }

        [Display(Name = "应用简介(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string IntroductionZh { get; set; }

        [Display(Name = "应用简介(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string IntroductionEn { get; set; }

        [Display(Name = "应用详情(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string DescriptionZh { get; set; }

        [Display(Name = "应用详情(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string DescriptionEn { get; set; }

        [Display(Name = "应用分组")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string GroupId { get; set; }

        public IEnumerable<SelectListItem> ExampleSelectList { get; set; }

        [Display(Name = "应用主图")]
        [Required(ErrorMessage = "{0}为必须的")]
        public string ImgPath { get; set; }
    }
}
