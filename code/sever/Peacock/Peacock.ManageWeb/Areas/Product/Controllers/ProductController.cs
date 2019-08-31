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

            if (id == 0) return View(vm);

            var entity = peacockDbContext.T_Pro_Product
                                         .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByIntroduction).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.NameZh = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent;
                vm.NameEn = entity.LanguageRelationByName.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent;
                vm.IntroductionZh = GetLanguageContent(entity.LanguageRelationByIntroduction, LanguageType.ZhCn);
                vm.IntroductionEn = GetLanguageContent(entity.LanguageRelationByIntroduction, LanguageType.En);
                vm.DescriptionZh = GetLanguageContent(entity.LanguageRelationByDescription, LanguageType.ZhCn);
                vm.DescriptionEn = GetLanguageContent(entity.LanguageRelationByDescription, LanguageType.En);
                vm.ImgPath = entity.ImgPath;
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
                entity.ImgPath = model.ImgPath;
                entity.GroupId = int.Parse(model.GroupId);
                entity.Name = model.NameZh;
                entity.Description = model.DescriptionZh;
                entity.OrderId = model.OrderId;
                entity.CreatedTime = dtNow;
                entity.CreatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                //设置多语言
                var nameLanguageDict = new Dictionary<string, string>();
                nameLanguageDict.Add(LanguageType.ZhCn, model.NameZh);
                nameLanguageDict.Add(LanguageType.En, model.NameEn);
                entity.LanguageRelationByName = EditLanguageContent(entity.LanguageRelationByName, nameLanguageDict);

                var introductionLanguageDict = new Dictionary<string, string>();
                introductionLanguageDict.Add(LanguageType.ZhCn, model.IntroductionZh);
                introductionLanguageDict.Add(LanguageType.En, model.IntroductionEn);
                entity.LanguageRelationByDescription = EditLanguageContent(entity.LanguageRelationByIntroduction, introductionLanguageDict);

                var descLanguageDict = new Dictionary<string, string>();
                descLanguageDict.Add(LanguageType.ZhCn, model.DescriptionZh);
                descLanguageDict.Add(LanguageType.En, model.DescriptionEn);
                entity.LanguageRelationByDescription = EditLanguageContent(entity.LanguageRelationByDescription, descLanguageDict);

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_Product
                                         .Include(i => i.LanguageRelationByName).ThenInclude(i => i.TSystemLanguageContent)
                                         .Include(i => i.LanguageRelationByDescription).ThenInclude(i => i.TSystemLanguageContent)
                                         .FirstOrDefault(i => i.ID == model.Id && !i.IsDeleted);
                if (entity == null)
                {
                    ModelState.AddModelError("Code", "不存在记录，无法更新");
                    return View("Edit", model);
                }

                entity.ImgPath = model.ImgPath;
                entity.GroupId = int.Parse(model.GroupId);
                entity.Name = model.NameZh;
                entity.Description = model.DescriptionZh;
                entity.OrderId = model.OrderId;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                var nameLanguageDict = new Dictionary<string, string>();
                nameLanguageDict.Add(LanguageType.ZhCn, model.NameZh);
                nameLanguageDict.Add(LanguageType.En, model.NameEn);
                entity.LanguageRelationByName = EditLanguageContent(entity.LanguageRelationByName, nameLanguageDict);

                var introductionLanguageDict = new Dictionary<string, string>();
                introductionLanguageDict.Add(LanguageType.ZhCn, model.IntroductionZh);
                introductionLanguageDict.Add(LanguageType.En, model.IntroductionEn);
                entity.LanguageRelationByIntroduction = EditLanguageContent(entity.LanguageRelationByIntroduction, introductionLanguageDict);

                var descLanguageDict = new Dictionary<string, string>();
                descLanguageDict.Add(LanguageType.ZhCn, model.DescriptionZh);
                descLanguageDict.Add(LanguageType.En, model.DescriptionEn);
                entity.LanguageRelationByDescription = EditLanguageContent(entity.LanguageRelationByDescription, descLanguageDict);

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


        public ActionResult GetImgList(int productId)
        {
            var list = peacockDbContext.T_Pro_ProductImg.Where(i => i.ProductId == productId)
                .OrderBy(o => o.OrderId)
                .Select(c => new ProductImgItem
                {
                    Id = c.ID,
                    ProductId = c.ProductId,
                    OrderId = c.OrderId,
                    ImgUrl = c.ImgUrl,
                }).ToList();

            ViewData["ProductId"] = productId;

            return View("ImgList", list);
        }

        public ActionResult EditProductImg(int id, int productId)
        {
            ProductImgItem result = new ProductImgItem()
            {
                ProductId = productId,
            };
            if (id > 0)
            {
                result = peacockDbContext.T_Pro_ProductImg.Where(i => i.ID == id)
                            .Select(c => new ProductImgItem
                            {
                                Id = c.ID,
                                OrderId = c.OrderId,
                                ImgUrl = c.ImgUrl,
                                ProductId = c.ProductId,
                            }).FirstOrDefault();
            }
            return PartialView("ImgEdit", result);
        }

        [HttpPost]
        public JsonResult SaveImg(ProductImgItem vm)
        {
            if (vm.Id > 0)
            {
                var entity = peacockDbContext.T_Pro_ProductImg.Where(i => i.ID == vm.Id).FirstOrDefault();
                entity.ImgUrl = vm.ImgUrl;
                entity.OrderId = vm.OrderId;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = DateTime.Now;
                peacockDbContext.Update(entity);
            }
            else
            {
                var entity = new T_Pro_ProductImg()
                {
                    ProductId = vm.ProductId,
                    ImgUrl = vm.ImgUrl,
                    OrderId = vm.OrderId,
                    CreatedBy = userName,
                    CreatedTime = DateTime.Now,
                    LastUpdatedBy = userName,
                    LastUpdatedTime = DateTime.Now,
                };
                peacockDbContext.T_Pro_ProductImg.Add(entity);
            }
            peacockDbContext.SaveChanges();
            return Json(Success());
        }

        [HttpPost]
        public JsonResult DeleteProductImg(int id)
        {
            var entity = peacockDbContext.T_Pro_ProductImg.FirstOrDefault(i => i.ID == id);
            if (entity == null) return Json(Fail("不存在记录"));
            peacockDbContext.T_Pro_ProductImg.Remove(entity);
            peacockDbContext.SaveChanges();
            return Json(Success("删除成功"));
        }
    }
}
