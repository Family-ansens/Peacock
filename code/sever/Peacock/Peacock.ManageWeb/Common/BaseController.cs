using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb
{
    public class BaseController : Controller
    {
        protected readonly PeacockDbContext peacockDbContext;
        protected readonly string userName;

        public BaseController(PeacockDbContext peacockDbContext)
        {
            this.peacockDbContext = peacockDbContext;
            userName = User?.Identity?.Name ?? string.Empty;
        }

        protected T_System_LanguageContent CreateLanguageContentEntity(string content, string languageType)
        {
            DateTime dtNow = DateTime.Now;
            T_System_LanguageContent entity = new T_System_LanguageContent();
            entity.DisplayContent = content;
            entity.LanguageType = languageType;
            entity.CreatedBy = userName;
            entity.CreatedTime = dtNow;
            entity.LastUpdatedBy = userName;
            entity.LastUpdatedTime = dtNow;
            return entity;
        }
    }
}
