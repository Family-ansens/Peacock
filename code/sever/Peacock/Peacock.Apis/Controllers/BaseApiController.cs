using Microsoft.AspNetCore.Mvc;
using Peacock.Apis.Common;
using Peacock.Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Controllers
{
    public class BaseApiController : ControllerBase
    {
        protected readonly PeacockDbContext dbContext;

        public BaseApiController(PeacockDbContext peacockDbContext) : base()
        {
            dbContext = peacockDbContext;
        }

        protected string GetLanguageContent(T_System_LanguageRelation r, string languageType)
        {
            return r?.TSystemLanguageContent?.FirstOrDefault(i => i.LanguageType == languageType)?.DisplayContent ?? string.Empty;
        }

        protected string GetLanguage()
        {
            return Request.GetLanguage();
        }
    }
}
