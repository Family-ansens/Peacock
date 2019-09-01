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
    public class EvaluationController : BaseController
    {
        public EvaluationController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {
            //_logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList(BaseSearchModel model)
        {
            var query = peacockDbContext.T_Evaluation
                .OrderByDescending(o => o.CreatedTime);
            int count = query.Count();
            var list = query.Skip(model.offset).Take(model.limit).Select(c => new EvaluationItem
            {
                Id = c.ID,
                Name = c.Name,
                Tel = c.Tel,
                Email = c.Email,
                CreatedTime = c.CreatedTime,
            }).ToList();
            return Json(new { total = count, rows = list });
        }

        public IActionResult Detail(int id)
        {
            var query = peacockDbContext.T_Evaluation.Where(i => i.ID == id).OrderByDescending(o => o.CreatedTime);
            var result = query.Select(c => new EvaluationItem
            {
                Id = id,
                Name = c.Name,
                Tel = c.Tel,
                Content = c.Content,
                Email = c.Email,
                OtherContact = System.Web.HttpUtility.UrlDecode(c.Content),
                CreatedTime = c.CreatedTime,
                IpAddress = c.IpAddress,
            }).FirstOrDefault();
            return View(result);
        }
    }
}
