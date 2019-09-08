using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Models
{
    public class ChangePwdModel
    {
        public string UserName { get; set; }

        [Required(ErrorMessage = "{0}是必填项")]
        [Display(Name = "旧密码")]
        public string OldPassword { get; set; }

        [Required(ErrorMessage = "{0}是必填项")]
        [Display(Name = "新密码")]
        public string Password { get; set; }

        [Required(ErrorMessage = "{0}是必填项")]
        [Display(Name = "确认密码")]
        public string ConfirmPassword { get; set; }
    }
}
