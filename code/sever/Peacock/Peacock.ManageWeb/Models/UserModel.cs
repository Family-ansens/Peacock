using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        /// <summary>
        /// 用户名
        /// </summary>
        [Display(Name = "用户名(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        [Display(Name = "密码(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string Password { get; set; }
        /// <summary>
        /// 确认密码
        /// </summary>
        [Display(Name = "确认密码(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ConfirmPassword { get; set; }
    }
}
