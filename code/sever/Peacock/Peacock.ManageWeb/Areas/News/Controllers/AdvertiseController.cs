using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Areas.News.Controllers
{
    [Authorize]
    [Area("News")]
    public class AdvertiseController : BaseController
    {
        public AdvertiseController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            var list = peacockDbContext.T_Advertise.Where(i => !i.IsDeleted)
                        .OrderByDescending(o => o.OrderId)
                        .Select(c => new AdvertiseImgItem
                        {
                            Id = c.ID,
                            OrderId = c.OrderId,
                            ImgUrl = c.ImgUrl,
                        }).ToList();

            return View(list);
        }

        public ActionResult Edit(int id)
        {
            AdvertiseImgItem result = new AdvertiseImgItem()
            {
                Id = id,
            };
            if (id > 0)
            {
                result = peacockDbContext.T_Advertise.Where(i => i.ID == id)
                            .Select(c => new AdvertiseImgItem
                            {
                                Id = c.ID,
                                OrderId = c.OrderId,
                                ImgUrl = c.ImgUrl,
                            }).FirstOrDefault();
            }
            return PartialView("Edit", result);
        }

        [HttpPost]
        public JsonResult SaveImg(AdvertiseImgItem vm)
        {
            if (vm.Id > 0)
            {
                var entity = peacockDbContext.T_Advertise.Where(i => i.ID == vm.Id).FirstOrDefault();
                entity.ImgUrl = vm.ImgUrl;
                entity.OrderId = vm.OrderId;
                entity.LastUpdatedBy = userName;
                entity.LastUpdatedTime = DateTime.Now;
                peacockDbContext.Update(entity);
            }
            else
            {
                var entity = new T_Advertise()
                {
                    ImgUrl = vm.ImgUrl,
                    OrderId = vm.OrderId,
                    CreatedBy = userName,
                    CreatedTime = DateTime.Now,
                    LastUpdatedBy = userName,
                    LastUpdatedTime = DateTime.Now,
                };
                peacockDbContext.T_Advertise.Add(entity);
            }
            peacockDbContext.SaveChanges();
            return Json(Success());
        }

        [HttpPost]
        public JsonResult DeleteImg(int id)
        {
            var entity = peacockDbContext.T_Advertise.FirstOrDefault(i => i.ID == id);
            if (entity == null) return Json(Fail("不存在记录"));
            entity.IsDeleted = true;
            entity.LastUpdatedBy = userName;
            entity.LastUpdatedTime = DateTime.Now;
            peacockDbContext.T_Advertise.Update(entity);
            peacockDbContext.SaveChanges();
            return Json(Success("删除成功"));
        }
    }
}
