﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb.Areas.News.Controllers
{
    [Area("News")]
    public class AnnouncementController : BaseController
    {
        public AnnouncementController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_Announcement.Where(i => !i.IsDeleted).Count();
            var list = peacockDbContext.T_Announcement.Where(i => !i.IsDeleted).Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, rows = list });
        }

        public ActionResult Edit(int id)
        {
            AnnouncementItem vm = new AnnouncementItem();
            if (id == 0)
                return View(vm);
            var entity = peacockDbContext.T_Announcement
                                         .Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.TitleZh = GetLanguageContent(entity.LanguageRelationByTitle, LanguageType.ZhCn);
                vm.TitleEn = GetLanguageContent(entity.LanguageRelationByTitle, LanguageType.En);
                vm.ContentZh = GetLanguageContent(entity.LanguageRelationByContent, LanguageType.ZhCn);
                vm.ContentEn = GetLanguageContent(entity.LanguageRelationByContent, LanguageType.En);
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(AnnouncementItem model)
        {
            if (!ModelState.IsValid)
            {
                return View("Edit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_Announcement entity = new T_Announcement();

            if (isCreate)
            {
                entity.Title = model.TitleZh;
                entity.IsDeleted = false;
                entity.Content = model.ContentZh;
                entity.CreatedBy = userName;
                entity.CreatedTime = dtNow;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                //设置多语言
                entity.LanguageRelationByTitle = EditLanguageContent(entity.LanguageRelationByTitle, model.TitleLanguageDict);
                entity.LanguageRelationByContent = EditLanguageContent(entity.LanguageRelationByContent, model.ContentLanguageDict);

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Announcement.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == model.Id);

                if (entity == null)
                {
                    ModelState.AddModelError("TitleZh", "不存在记录，无法更新");
                    return View("Edit", model);
                }

                entity.Title = model.TitleZh;
                entity.Content = model.ContentZh;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                entity.LanguageRelationByTitle = EditLanguageContent(entity.LanguageRelationByTitle, model.TitleLanguageDict);
                entity.LanguageRelationByContent = EditLanguageContent(entity.LanguageRelationByContent, model.ContentLanguageDict);

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();
            return RedirectToAction("Edit", new { id = entity.ID });
        }

        [HttpPost]
        public ActionResult DeleteByIds(List<int> ids)
        {
            var list = peacockDbContext.T_Announcement.Where(i => ids.Contains(i.ID));
            List<T_Announcement> updateList = new List<T_Announcement>();
            foreach (var item in list)
            {
                if (item.IsDeleted)
                {
                    return Json(Fail("记录已删除，不能重复操作"));
                }
                else
                {
                    item.IsDeleted = true;
                    item.LastUpdatedTime = DateTime.Now;
                    item.LastUpdatedBy = userName;

                    updateList.Add(item);
                }
            }
            if (updateList.Count > 0)
            {
                peacockDbContext.UpdateRange(updateList);
                peacockDbContext.SaveChanges();

                return Json(Success("删除成功"));
            }

            return Json(Fail("删除失败"));
        }
    }
}