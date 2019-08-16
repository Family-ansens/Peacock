using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb.Areas.News
{
    [Authorize]
    [Area("News")]
    public class NewController : BaseController
    {
        public NewController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetNews(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_New.Where(i => !i.IsDeleted).Count();
            var list = peacockDbContext.T_New.Where(i => !i.IsDeleted).Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, rows = list });
        }

        public ActionResult Edit(int id)
        {
            NewItem vm = new NewItem();
            if (id == 0)
                return View(vm);
            var entity = peacockDbContext.T_New
                                         .Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByContent).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.TitleZh = entity.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.TitleEn = entity.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;
                vm.ContentZh = entity.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.ContentEn = entity.LanguageRelationByContent.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(NewItem model)
        {
            if (!ModelState.IsValid)
            {
                return View("Edit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_New entity = new T_New();

            if (isCreate)
            {
                entity.Title = model.TitleZh;
                entity.IsDeleted = false;
                entity.IsPublish = false;
                entity.Content = model.ContentZh;
                entity.CreatedBy = userName;
                entity.CreatedTime = dtNow;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                //设置多语言
                T_System_LanguageContent titleZhContent = CreateLanguageContentEntity(model.TitleZh, LanguageType.ZhCn);
                T_System_LanguageContent titleEnContent = CreateLanguageContentEntity(model.TitleEn, LanguageType.En);
                T_System_LanguageContent contentZhContent = CreateLanguageContentEntity(model.ContentZh, LanguageType.ZhCn);
                T_System_LanguageContent contentEnContent = CreateLanguageContentEntity(model.ContentEn, LanguageType.En);

                entity.LanguageRelationByTitle = new T_System_LanguageRelation()
                {
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedDate = dtNow,
                    TSystemLanguageContent = new List<T_System_LanguageContent>()
                    {
                        titleZhContent,
                        titleEnContent,
                    }
                };
                entity.LanguageRelationByContent = new T_System_LanguageRelation()
                {
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedDate = dtNow,
                    TSystemLanguageContent = new List<T_System_LanguageContent>()
                    {
                        contentZhContent,
                        contentEnContent,
                    }
                };

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_New.Include(i => i.LanguageRelationByTitle).ThenInclude(i => i.TSystemLanguageContent)
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

                var zhTitleLanguageEntity = entity.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn);
                zhTitleLanguageEntity.DisplayContent = model.TitleZh;
                zhTitleLanguageEntity.LastUpdatedBy = userName;
                zhTitleLanguageEntity.LastUpdatedTime = dtNow;

                var enTitleLanguageEntity = entity.LanguageRelationByTitle.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En);
                enTitleLanguageEntity.DisplayContent = model.TitleEn;
                enTitleLanguageEntity.LastUpdatedBy = userName;
                enTitleLanguageEntity.LastUpdatedTime = dtNow;

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();
            return RedirectToAction("Edit", new { id = entity.ID });
        }

        [HttpPost]
        public ActionResult DeleteByIds(List<int> ids)
        {
            var list = peacockDbContext.T_New.Where(i => ids.Contains(i.ID));
            List<T_New> updateList = new List<T_New>();
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

        [HttpPost]
        public ActionResult SwitchPublish(int id)
        {
            var item = peacockDbContext.T_New.Where(i => i.ID == id).FirstOrDefault();
            item.IsPublish = !item.IsPublish;
            item.LastUpdatedTime = DateTime.Now;
            item.LastUpdatedBy = userName;
            peacockDbContext.Update(item);
            peacockDbContext.SaveChanges();

            return Json(Success(item.IsPublish ? "发布成功" : "取消发布成功"));
        }

    }
}