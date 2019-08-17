﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Peacock.Dal;
using Peacock.ViewModel.Manage;
using Peacock.ViewModel.Manage.ProductGroup;

namespace Peacock.ManageWeb.Areas.Product.Controllers
{
    [Authorize]
    [Area("Product")]
    public class ProductGroupController : BaseController
    {
        private readonly ILogger _logger;

        public ProductGroupController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetProductGroup(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_Pro_ProductGroup.Where(i => !i.IsDeleted).Count();
            var list = peacockDbContext.T_Pro_ProductGroup.Where(i => !i.IsDeleted).Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, rows = list });
        }

        public ActionResult Edit(int id)
        {
            ProductGroupItem vm = new ProductGroupItem();
            if (id == 0)
                return View(vm);
            var entity = peacockDbContext.T_Pro_ProductGroup
                                         .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.Id == id);
            if (entity != null)
            {
                vm.Id = entity.Id;
                vm.Code = entity.Code;
                vm.NameZh = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.NameEn = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;
                vm.OrderId = entity.OrderId;
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(ProductGroupItem model)
        {
            if (!ModelState.IsValid)
            {
                return View("Edit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_Pro_ProductGroup entity = new T_Pro_ProductGroup();

            if (isCreate)
            {
                entity.Code = model.Code;
                entity.Name = model.NameZh;
                entity.CreatedTime = dtNow;
                entity.CreatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;
                entity.IsDeleted = false;
                //设置多语言
                T_System_LanguageContent nameZhContent = CreateLanguageContentEntity(model.NameZh, LanguageType.ZhCn);
                T_System_LanguageContent nameEnContent = CreateLanguageContentEntity(model.NameEn, LanguageType.En);

                T_System_LanguageRelation languageRelationEntity = new T_System_LanguageRelation()
                {
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedDate = dtNow,
                    TSystemLanguageContent = new List<T_System_LanguageContent>()
                    {
                        nameZhContent,
                        nameEnContent,
                    }
                };
                entity.LanguageRelationByName = languageRelationEntity;

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_ProductGroup.Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                            .FirstOrDefault(i => i.Id == model.Id && !i.IsDeleted);
                if (entity == null)
                {
                    ModelState.AddModelError("Code", "不存在记录，无法更新");
                    return View("Edit", model);
                }

                entity.Code = model.Code;
                entity.Name = model.NameZh;
                entity.OrderId = model.OrderId;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                var zhNameLanguageEntity = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn);
                zhNameLanguageEntity.DisplayContent = model.NameZh;
                zhNameLanguageEntity.LastUpdatedBy = userName;
                zhNameLanguageEntity.LastUpdatedTime = dtNow;

                var enNameLanguageEntity = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En);
                enNameLanguageEntity.DisplayContent = model.NameEn;
                enNameLanguageEntity.LastUpdatedBy = userName;
                enNameLanguageEntity.LastUpdatedTime = dtNow;

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();



            return RedirectToAction("Edit", new { id = entity.Id });
        }

        [HttpPost]
        public ActionResult DeleteByIds(List<int> ids)
        {
            var list = peacockDbContext.T_Pro_ProductGroup.Where(i => ids.Contains(i.Id));
            List<T_Pro_ProductGroup> updateList = new List<T_Pro_ProductGroup>();
            foreach(var item in list)
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