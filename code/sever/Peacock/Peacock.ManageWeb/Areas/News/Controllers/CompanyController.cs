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

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList()
        {
            var query = peacockDbContext.T_Company
                .Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                .Where(i => !i.IsDeleted);
            int count = query.Count();
            var list = query.OrderBy(o => o.OrderId)
                .Select(c => new CompanyItem
                {
                    Id = c.ID,
                    OrderId = c.OrderId,
                    TitleZh = c.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn).DisplayContent,
                    ImgUrl = c.ImgPath,
                    LastUpdatedTime = c.LastUpdatedTime,
                }).ToList();
            return Json(new { total = count, rows = list });
        }

        public ActionResult Edit(int id)
        {
            if (id == 0)
            {
                return View(new CompanyItem());
            }

            CompanyItem vm = new CompanyItem();
            var entity = peacockDbContext.T_Company
                                     .Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                     .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                     .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                     .FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm = new CompanyItem()
                {
                    Id = entity.ID,
                    OrderId = entity.OrderId,
                    ImgUrl = entity.ImgPath,
                    TitleZh = GetLanguageContent(entity.LanguageRelationByTitle, LanguageType.ZhCn),
                    TitleEn = GetLanguageContent(entity.LanguageRelationByTitle, LanguageType.En),
                    IntroductionZh = GetLanguageContent(entity.LanguageRelationByIntroduction, LanguageType.ZhCn),
                    IntroductionEn = GetLanguageContent(entity.LanguageRelationByIntroduction, LanguageType.En),
                    ContentZh = GetLanguageContent(entity.LanguageRelationByContent, LanguageType.ZhCn),
                    ContentEn = GetLanguageContent(entity.LanguageRelationByContent, LanguageType.En),
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
                                     .Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                     .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                     .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                     .FirstOrDefault(i => i.ID == vm.Id);

            if (entity == null)
            {
                entity = new T_Company()
                {
                    OrderId = vm.OrderId,
                    Content = vm.ContentZh,
                    ImgPath = vm.ImgUrl,
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedTime = dtNow,
                };
                entity.LanguageRelationByTitle = EditLanguageContent(entity.LanguageRelationByTitle, vm.TitleLanguageDict);
                entity.LanguageRelationByIntroduction = EditLanguageContent(entity.LanguageRelationByIntroduction, vm.IntroductionLanguageDict);
                entity.LanguageRelationByContent = EditLanguageContent(entity.LanguageRelationByContent, vm.ContentLanguageDict);
                peacockDbContext.Add(entity);
            }
            else
            {
                entity.OrderId = vm.OrderId;
                entity.Content = vm.ContentZh;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.ImgPath = vm.ImgUrl;

                entity.LanguageRelationByTitle = EditLanguageContent(entity.LanguageRelationByTitle, vm.TitleLanguageDict);
                entity.LanguageRelationByIntroduction = EditLanguageContent(entity.LanguageRelationByIntroduction, vm.IntroductionLanguageDict);
                entity.LanguageRelationByContent = EditLanguageContent(entity.LanguageRelationByContent, vm.ContentLanguageDict);
                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();
            return RedirectToAction("Edit", new { id = entity.ID });
        }

        [HttpPost]
        public JsonResult DeleteByIds(int id)
        {
            var entity = peacockDbContext.T_Company.FirstOrDefault(i => i.ID == id);
            if (entity == null) return Json(Fail("不存在记录"));
            peacockDbContext.T_Company.Remove(entity);
            peacockDbContext.SaveChanges();
            return Json(Success("删除成功"));
        }
    }
}
