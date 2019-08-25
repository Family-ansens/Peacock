using Microsoft.AspNetCore.Http;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Common
{
    public static class LanguageHelper
    {
        public static string GetLanguage(this HttpRequest request)
        {
            string language = request?.Headers["Accept-Language"];
            if (string.IsNullOrEmpty(language)) return LanguageType.ZhCn;

            if ("en".Equals(language, StringComparison.CurrentCultureIgnoreCase)) return LanguageType.En;
            return LanguageType.ZhCn;
        }
    }
}
