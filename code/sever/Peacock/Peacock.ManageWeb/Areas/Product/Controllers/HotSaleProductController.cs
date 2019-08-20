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
    public class HotSaleProductController : BaseController
    {
        private readonly ILogger _logger;

        public HotSaleProductController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetHotSaleProduct(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_Pro_HotSaleProduct.Count();
            var list = peacockDbContext.T_Pro_HotSaleProduct.Include(i => i.Product)
                .Skip(searchModel.offset).Take(searchModel.limit).OrderBy(o => o.OrderId)
                .Select(c => new
                {
                    Id = c.ID,
                    ProductId = c.ProductId,
                    ProductName = c.Product.Name,
                    ProductImgPath = c.Product.ImgPath,
                    OrderId = c.OrderId,
                    LastUpdatedTime = c.LastUpdatedTime,
                }).ToList();
            return Json(new { total = count, row = list });
        }

        public ActionResult Edit(int id)
        {
            HotSaleProductItem vm = new HotSaleProductItem();
            vm.ProductSelectList = peacockDbContext.T_Pro_Product.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
                                                    .Select(c => new SelectListItem
                                                    {
                                                        Value = c.ID.ToString(),
                                                        Text = c.Name,
                                                    }).ToList();

            if (id == 0) return View(vm);

            var entity = peacockDbContext.T_Pro_HotSaleProduct.Include(i => i.Product).FirstOrDefault(i => i.ID == id);
            if (entity != null)
            {
                vm.Id = entity.ID;
                vm.ProductId = entity.ProductId;
                vm.OrderId = entity.OrderId;
                vm.ProductName = entity.Product.Name;
                vm.ProductImgPath = entity.Product.ImgPath;
            }
            return View(vm);
        }

        [HttpPost]
        public ActionResult Save(HotSaleProductItem model)
        {
            if (!ModelState.IsValid)
            {
                model.ProductSelectList = peacockDbContext.T_Pro_Product.Where(i => !i.IsDeleted).OrderBy(o => o.OrderId)
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
            T_Pro_HotSaleProduct entity = new T_Pro_HotSaleProduct();

            if (isCreate)
            {
                entity.ProductId = model.ProductId;
                entity.OrderId = model.OrderId;
                entity.CreatedTime = dtNow;
                entity.CreatedBy = userName;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                peacockDbContext.Add(entity);
            }
            else
            {
                entity = peacockDbContext.T_Pro_HotSaleProduct.FirstOrDefault(i => i.ID == model.Id);
                if (entity == null)
                {
                    ModelState.AddModelError("ProductId", "不存在记录，无法更新");
                    return View("Edit", model);
                }

                entity.ProductId = model.ProductId;
                entity.OrderId = model.OrderId;
                entity.OrderId = model.OrderId;
                entity.LastUpdatedTime = dtNow;
                entity.LastUpdatedBy = userName;

                peacockDbContext.Update(entity);
            }
            peacockDbContext.SaveChanges();

            return RedirectToAction("Edit", new { id = entity.ID });
        }

        [HttpPost]
        public ActionResult DeleteByIds(int id)
        {
            var entity = peacockDbContext.T_Pro_HotSaleProduct.FirstOrDefault(i => i.ID == id);
            if (entity == null)
            {
                return Json(Fail("记录已删除，不能重复操作"));
            }
            else
            {
                peacockDbContext.T_Pro_HotSaleProduct.Remove(entity);
            }

            return Json(Success("删除成功"));
        }
    }
}
