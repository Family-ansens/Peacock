using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Peacock.ManageWeb.Models;

namespace Peacock.ManageWeb.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public IActionResult Login(string returnUrl)
        {
            LoginModel model = new LoginModel();
            return View(model);
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (model.UserName.Equals("admin", StringComparison.InvariantCultureIgnoreCase) && model.Password.Equals("123"))
            {
                //登陆授权
                var claims = new List<Claim>();
                claims.Add(new Claim(ClaimTypes.Name, model.UserName));
                var indentity = new ClaimsIdentity(claims, "PeacockManageWeb");
                var principal = new ClaimsPrincipal(indentity);
                await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    principal);

                string redirectAction = Url.Action("Index");
                if (!string.IsNullOrEmpty(HttpContext.Request.Query["ReturnUrl"].FirstOrDefault()))
                {
                    redirectAction = HttpContext.Request.Query["ReturnUrl"].FirstOrDefault();
                }
                else
                {
                    redirectAction = Url.Action("Index","GroupGroup", new { area = "Product" });
                }

                return Redirect(redirectAction);
            }
            return View(model);
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return Redirect(Url.Action("Login"));
        }
    }
}