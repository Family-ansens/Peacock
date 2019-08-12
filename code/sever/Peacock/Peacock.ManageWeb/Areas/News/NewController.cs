using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;

namespace Peacock.ManageWeb.Areas.News
{
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
    }
}