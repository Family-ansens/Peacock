using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Peacock.Dal;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Areas.Product.Controllers
{
    [Authorize]
    [Area("Product")]
    public class ProductController : BaseController
    {
        private readonly ILogger _logger;

        public ProductController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetProduct(ProductSearchModel searchModel)
        {
            var query = peacockDbContext.T_Pro_Product
                //.Include(i => i.ProductGourp)
                .Where(i => !i.IsDeleted);
            if (searchModel.GroupId != 0)
            {
                query = query.Where(i => i.GroupId == searchModel.GroupId);
            }
            int count = query.Count();
            var list = query.Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, rows = list });
        }

        public ActionResult Edit(int id)
        {
            ProductItem vm = new ProductItem();
            vm.GroupSelectList = peacockDbContext.T_Pro_ProductGroup.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                                                    .Select(c => new SelectListItem
                                                    {
                                                        Value = c.Id.ToString(),
                                                        Text = c.Name,
                                                    }).ToList();

            if (id == 0)
                return View(vm);
            var entity = peacockDbContext.T_Pro_Product
                                         .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.NameZh = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.NameEn = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;
                vm.DescriptionZh = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.DescriptionEn = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;

                vm.OrderId = entity.OrderId;
                vm.GroupId = entity.GroupId.ToString();
            }



            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(ProductItem model)
        {
            if (!ModelState.IsValid)
            {
                model.GroupSelectList = peacockDbContext.T_Pro_ProductGroup.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                                                    .Select(c => new SelectListItem
                                                    {
                                                        Value = c.Id.ToString(),
                                                        Text = c.Name,
                                                    }).ToList();
                return View("Edit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_Pro_Product entity = new T_Pro_Product();

            if (isCreate)
            {
                entity.GroupId = int.Parse(model.GroupId);
                entity.Name = model.NameZh;
                entity.Description = model.DescriptionZh;
                entity.OrderId = model.OrderId;
                entity.CreatedTime = dtNow;
                entity.CreatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;
                //设置多语言
                T_System_LanguageContent nameZhContent = CreateLanguageContentEntity(model.NameZh, LanguageType.ZhCn);
                T_System_LanguageContent nameEnContent = CreateLanguageContentEntity(model.NameEn, LanguageType.En);
                T_System_LanguageRelation languageRelationByName = new T_System_LanguageRelation()
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
                entity.LanguageRelationByName = languageRelationByName;

                if (!string.IsNullOrEmpty(model.DescriptionZh) || !string.IsNullOrEmpty(model.DescriptionEn))
                {
                    T_System_LanguageRelation languageRelationByDescription = new T_System_LanguageRelation()
                    {
                        CreatedBy = userName,
                        CreatedTime = dtNow,
                        LastUpdatedBy = userName,
                        LastUpdatedDate = dtNow,
                        TSystemLanguageContent = new List<T_System_LanguageContent>()
                    };
                    if (!string.IsNullOrEmpty(model.DescriptionZh))
                    {
                        T_System_LanguageContent descZhContent = CreateLanguageContentEntity(model.DescriptionZh, LanguageType.ZhCn);
                        languageRelationByDescription.TSystemLanguageContent.Add(descZhContent);
                    }
                    if (!string.IsNullOrEmpty(model.DescriptionEn))
                    {
                        T_System_LanguageContent descEnContent = CreateLanguageContentEntity(model.DescriptionEn, LanguageType.En);
                        languageRelationByDescription.TSystemLanguageContent.Add(descEnContent);
                    }

                    entity.LanguageRelationByDescription = languageRelationByDescription;
                }

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_Product.Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                            .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                            .FirstOrDefault(i => i.ID == model.Id && !i.IsDeleted);
                if (entity == null)
                {
                    ModelState.AddModelError("Code", "不存在记录，无法更新");
                    return View("Edit", model);
                }

                entity.GroupId = int.Parse(model.GroupId);
                entity.Name = model.NameZh;
                entity.Description = model.DescriptionZh;
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

                var zhDescLanguageEntity = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn);
                zhDescLanguageEntity.DisplayContent = model.NameZh;
                zhDescLanguageEntity.LastUpdatedBy = userName;
                zhDescLanguageEntity.LastUpdatedTime = dtNow;

                var enDescLanguageEntity = entity.LanguageRelationByDescription.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En);
                enDescLanguageEntity.DisplayContent = model.NameEn;
                enDescLanguageEntity.LastUpdatedBy = userName;
                enDescLanguageEntity.LastUpdatedTime = dtNow;

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();



            return RedirectToAction("Edit", new { id = entity.ID });
        }

        [HttpPost]
        public ActionResult DeleteByIds(List<int> ids)
        {
            var list = peacockDbContext.T_Pro_Product.Where(i => ids.Contains(i.ID));
            List<T_Pro_Product> updateList = new List<T_Pro_Product>();
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
