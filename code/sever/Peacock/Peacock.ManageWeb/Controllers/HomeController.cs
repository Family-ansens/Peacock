using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Peacock.ManageWeb.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Demo()
        {
            return View();
        }
    }
}