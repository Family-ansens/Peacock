using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class CompanyItem
    {
        public int Id { get; set; }

        [Display(Name = "内容(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ContentZh { get; set; }

        [Display(Name = "内容(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ContentEn { get; set; }

        [Display(Name = "宣传图")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string ImgUrl { get; set; }

        [JsonIgnore]
        public Dictionary<string, string> ContentLanguageDict
        {
            get
            {
                Dictionary<string, string> dict = new Dictionary<string, string>();
                dict.Add(LanguageType.ZhCn, ContentZh);
                dict.Add(LanguageType.En, ContentEn);
                return dict;
            }
        }
    }
}
