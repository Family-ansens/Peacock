using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Peacock.Dal;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Areas.News.Controllers
{
    [Area("News")]
    public class CompanyController : BaseController
    {
        public CompanyController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public ActionResult Edit()
        {
            CompanyItem vm = new CompanyItem();
            var entity = peacockDbContext.T_Company
                                     .Include(i => i.LanguageRelationByContent).ThenInclude(i=>i.CompaniesWithContent)
                                     .FirstOrDefault();
            if (entity != null)
            {
                vm = new CompanyItem()
                {
                    Id = entity.ID,
                    ImgUrl = entity.ImgPath,
                    ContentZh = entity.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn).DisplayContent,
                    ContentEn = entity.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En).DisplayContent,
                };
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(CompanyItem vm)
        {
            DateTime dtNow = DateTime.Now;
            if (!ModelState.IsValid) return View("Edit", vm);

            var entity = peacockDbContext.T_Company
                                     .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.CompaniesWithContent)
                                     .FirstOrDefault();

            if (entity == null)
            {
                entity = new T_Company()
                {
                    Content = vm.ContentZh,
                    ImgPath = vm.ImgUrl,
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedTime = dtNow,
                };
                EditLanguageContent(entity.LanguageRelationByContent, vm.ContentLanguageDict);
                peacockDbContext.Add(entity);
            }
            else
            {
                entity.Content = vm.ContentZh;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = dtNow;

                entity.LanguageRelationByContent = EditLanguageContent(entity.LanguageRelationByContent, vm.ContentLanguageDict);
                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();
            return RedirectToAction("Edit");
        }
    }
}
