using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb.Areas.Product.Controllers
{
    [Area("Product")]
    public class ProductGroupController : Controller
    {
        private readonly PeacockDbContext _peacockDbContext;
        private readonly ILogger _logger;


        public ProductGroupController(PeacockDbContext peacockDbContext)
        {
            _peacockDbContext = peacockDbContext;
            //_logger = logger;
        }

        public IActionResult Index()
        {
            int count = _peacockDbContext.T_Pro_ProductGroup.Count();
            var list = _peacockDbContext.T_Pro_ProductGroup.Take(10).ToList();

            var pageResult = new PageResult<T_Pro_ProductGroup>();
            pageResult.Pager = new Pager()
            {
                Total = count,
                PageNumber = 1,
                PageSize = 10,
            };
            pageResult.List = list;

            return View(pageResult);
        }
    }
}