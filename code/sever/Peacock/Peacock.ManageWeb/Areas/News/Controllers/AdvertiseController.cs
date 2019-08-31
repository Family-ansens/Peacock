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
            return View();
        }

        public JsonResult GetList(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_Advertise.Where(i => !i.IsDeleted).Count();
            var list = peacockDbContext.T_Advertise.Where(i => i.IsDeleted).Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, row = list });
        }
    }
}
