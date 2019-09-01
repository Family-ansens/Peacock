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
    public class ExampleController : BaseController
    {
        private readonly ILogger _logger;

        public ExampleController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList(ExampleSearchModel searchModel)
        {
            var query = peacockDbContext.T_Pro_Example
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
            ExampleItem vm = new ExampleItem();
            vm.ExampleSelectList = peacockDbContext.T_Pro_ExampleGroup.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                                                    .Select(c => new SelectListItem
                                                    {
                                                        Value = c.ID.ToString(),
                                                        Text = c.Name,
                                                    }).ToList();

            if (id == 0) return View(vm);

            var entity = peacockDbContext.T_Pro_Example
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
                vm.DescriptionZh = entity.LanguageRelationByDescription?.TSystemLanguageContent?.FirstOrDefault(i => i.LanguageType == LanguageType.ZhCn)?.DisplayContent ?? string.Empty;
                vm.DescriptionEn = entity.LanguageRelationByDescription?.TSystemLanguageContent?.FirstOrDefault(i => i.LanguageType == LanguageType.En)?.DisplayContent ?? string.Empty;
                vm.ImgPath = entity.ImgPath;
                vm.OrderId = entity.OrderId;
                vm.GroupId = entity.GroupId.ToString();
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(ExampleItem model)
        {
            if (!ModelState.IsValid)
            {
                model.ExampleSelectList = peacockDbContext.T_Pro_Example.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                                                    .Select(c => new SelectListItem
                                                    {
                                                        Value = c.ID.ToString(),
                                                        Text = c.Name,
                                                    }).ToList();
                return View("Edit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_Pro_Example entity = new T_Pro_Example();

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
                entity.LanguageRelationByIntroduction = EditLanguageContent(entity.LanguageRelationByIntroduction, introductionLanguageDict);

                var descLanguageDict = new Dictionary<string, string>();
                descLanguageDict.Add(LanguageType.ZhCn, model.DescriptionZh);
                descLanguageDict.Add(LanguageType.En, model.DescriptionEn);
                entity.LanguageRelationByDescription = EditLanguageContent(entity.LanguageRelationByDescription, descLanguageDict);

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_Example
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
            var list = peacockDbContext.T_Pro_Example.Where(i => ids.Contains(i.ID));
            List<T_Pro_Example> updateList = new List<T_Pro_Example>();
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


        public ActionResult GetImgList(int exampleId)
        {
            var list = peacockDbContext.T_Pro_ExampleImg.Where(i => i.ExampleId == exampleId)
                .OrderBy(o => o.OrderId)
                .Select(c => new ExampleImgItem
                {
                    Id = c.ID,
                    ExampleId = c.ExampleId,
                    OrderId = c.OrderId,
                    ImgUrl = c.ImgUrl,
                }).ToList();

            ViewData["ExampleId"] = exampleId;

            return View("ImgList", list);
        }

        public ActionResult EditExampleImg(int id, int exampleId)
        {
            ExampleImgItem result = new ExampleImgItem()
            {
                ExampleId = exampleId,
            };
            if (id > 0)
            {
                result = peacockDbContext.T_Pro_ExampleImg.Where(i => i.ID == id)
                            .Select(c => new ExampleImgItem
                            {
                                Id = c.ID,
                                OrderId = c.OrderId,
                                ImgUrl = c.ImgUrl,
                                ExampleId = c.ExampleId,
                            }).FirstOrDefault();
            }
            return PartialView("ImgEdit", result);
        }

        [HttpPost]
        public JsonResult SaveImg(ExampleImgItem vm)
        {
            if (vm.Id > 0)
            {
                var entity = peacockDbContext.T_Pro_ExampleImg.Where(i => i.ID == vm.Id).FirstOrDefault();
                entity.ExampleId = vm.ExampleId;
                entity.ImgUrl = vm.ImgUrl;
                entity.OrderId = vm.OrderId;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = DateTime.Now;
                peacockDbContext.Update(entity);
            }
            else
            {
                var entity = new T_Pro_ExampleImg()
                {
                    ExampleId = vm.ExampleId,
                    ImgUrl = vm.ImgUrl,
                    OrderId = vm.OrderId,
                    CreatedBy = userName,
                    CreatedTime = DateTime.Now,
                    LastUpdatedBy = userName,
                    LastUpdatedTime = DateTime.Now,
                };
                peacockDbContext.T_Pro_ExampleImg.Add(entity);
            }
            peacockDbContext.SaveChanges();
            return Json(Success());
        }

        [HttpPost]
        public JsonResult DeleteExampleImg(int id)
        {
            var entity = peacockDbContext.T_Pro_ExampleImg.FirstOrDefault(i => i.ID == id);
            if (entity == null) return Json(Fail("不存在记录"));
            peacockDbContext.T_Pro_ExampleImg.Remove(entity);
            peacockDbContext.SaveChanges();
            return Json(Success("删除成功"));
        }

        public ActionResult ProductExampleRelationList(int exampleId)
        {
            ViewData["ExampleId"] = exampleId;
            var list = peacockDbContext.T_Pro_ExampleProductRelation.Where(i => i.ExampleId == exampleId)
                                .Include(i => i.Product)
                                .OrderByDescending(o => o.LastUpdatedTime)
                                .Select(c => new ExampleProductItem
                                {
                                    Id = c.ID,
                                    ProductId = c.ProductId,
                                    ProductName = c.Product.Name,
                                    ProductImgPath = c.Product.ImgPath,
                                }).ToList();
            return View(list);
        }

        public ActionResult ProductExampleRelationEdit(int id, int exampleId)
        {
            ExampleProductItem vm = new ExampleProductItem() { ExampleId = exampleId };
            var productList = peacockDbContext.T_Pro_Product.Where(i => !i.IsDeleted)
                                            .OrderByDescending(o => o.OrderId)
                                            .Select(c => new
                                            {
                                                c.ID,
                                                c.Name,
                                                c.ImgPath,
                                            }).ToList();

            vm.ProductImgDict = productList.ToDictionary(k => k.ID.ToString(), v => v.ImgPath);

            vm.ProductSelectList = productList.Select(c => new SelectListItem
                                            {
                                                Value = c.ID.ToString(),
                                                Text = c.Name,
                                            }).ToList();
            if (id == 0) return PartialView(vm);

            var entity = peacockDbContext.T_Pro_ExampleProductRelation.Include(i => i.Product).FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.ExampleId = entity.ExampleId;
                vm.ProductId = entity.ProductId;
                vm.ProductName = entity.Product.Name;
                vm.ProductImgPath = entity.Product.ImgPath;
            }
            return PartialView(vm);
        }

        [HttpPost]
        public ActionResult SaveExampleProduct(ExampleProductItem model)
        {
            if (!ModelState.IsValid)
            {
                var productList = peacockDbContext.T_Pro_Product.Where(i => !i.IsDeleted)
                                            .OrderByDescending(o => o.OrderId)
                                            .Select(c => new
                                            {
                                                c.ID,
                                                c.Name,
                                                c.ImgPath,
                                            }).ToList();

                model.ProductImgDict = productList.ToDictionary(k => k.ID.ToString(), v => v.ImgPath);

                model.ProductSelectList = productList.Select(c => new SelectListItem
                {
                    Value = c.ID.ToString(),
                    Text = c.Name,
                }).ToList();
                return PartialView("ProductExampleRelationEdit", model);
            }

            DateTime dtNow = DateTime.Now;
            bool isCreate = model.Id == 0;
            int id = model.Id;
            T_Pro_ExampleProductRelation entity = new T_Pro_ExampleProductRelation();

            if (isCreate)
            {
                entity.ProductId = model.ProductId;
                entity.ExampleId = model.ExampleId;
                entity.CreatedTime = dtNow;
                entity.CreatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_ExampleProductRelation.FirstOrDefault(i => i.ID == model.Id);
                if (entity == null)
                {
                    var productList = peacockDbContext.T_Pro_Product.Where(i => !i.IsDeleted)
                                            .OrderByDescending(o => o.OrderId)
                                            .Select(c => new
                                            {
                                                c.ID,
                                                c.Name,
                                                c.ImgPath,
                                            }).ToList();

                    model.ProductImgDict = productList.ToDictionary(k => k.ID.ToString(), v => v.ImgPath);

                    model.ProductSelectList = productList.Select(c => new SelectListItem
                    {
                        Value = c.ID.ToString(),
                        Text = c.Name,
                    }).ToList();

                    ModelState.AddModelError("ProductId", "不存在记录，无法更新");
                    return View("ProductExampleRelationEdit", model);
                }

                entity.ProductId = model.ProductId;
                entity.ExampleId = model.ExampleId;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();

            return Json(Success(string.Empty));
        }

        [HttpPost]
        public ActionResult DeleteExampleProductById(int id)
        {
            var entity = peacockDbContext.T_Pro_ExampleProductRelation.FirstOrDefault(i => i.ID == id);
            if (entity == null)
            {
                return Json(Fail("记录已删除，不能重复操作"));
            }
            else
            {
                peacockDbContext.T_Pro_ExampleProductRelation.Remove(entity);
                peacockDbContext.SaveChanges();
            }

            return Json(Success("删除成功"));
        }
    }
}
