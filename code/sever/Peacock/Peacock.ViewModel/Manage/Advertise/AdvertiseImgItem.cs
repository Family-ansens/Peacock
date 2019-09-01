using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class AdvertiseImgItem
    {
        public int Id { get; set; }

        [Display(Name = "序号")]
        [Required(ErrorMessage = "{0}为必填项")]
        public int OrderId { get; set; }

        [Display(Name = "图片")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ImgUrl { get; set; }
    }
}
