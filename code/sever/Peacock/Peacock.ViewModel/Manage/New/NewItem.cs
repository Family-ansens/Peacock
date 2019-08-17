﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class NewItem
    {
        public int Id { get; set; }

        [Display(Name = "标题(中文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string TitleZh { get; set; }

        [Display(Name = "标题(英文)")]
        [Required(ErrorMessage = "{0}为必填项")]
        public string TitleEn { get; set; }

        public DateTime PublishTime { get; set; }

        [Display(Name = "内容(中文)")]
        [Required(ErrorMessage ="{0}新闻内容为必填项")]
        public string ContentZh { get; set; }

        [Display(Name = "内容(英文)")]
        [Required(ErrorMessage = "{0}新闻内容为必填项")]
        public string ContentEn { get; set; }

        [JsonIgnore]
        public Dictionary<string, string> TitleLanguageDict
        {
            get
            {
                Dictionary<string, string> dict = new Dictionary<string, string>();
                dict.Add(LanguageType.ZhCn, TitleZh);
                dict.Add(LanguageType.En, TitleEn);
                return dict;
            }
        }

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