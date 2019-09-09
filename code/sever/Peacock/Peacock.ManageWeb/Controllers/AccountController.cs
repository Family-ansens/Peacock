using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ManageWeb.Models;

namespace Peacock.ManageWeb.Controllers
{
    [Authorize]
    public class AccountController : BaseController
    {
        public AccountController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {

        }

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
            string pwd = BaseIdentityService.HashPassword(model.Password);
            var userEntity = peacockDbContext.T_User.FirstOrDefault(i => i.UserName == model.UserName && i.Password == pwd);
            if (userEntity == null)
            {
                ViewData["error"] = "无效用户名或密码";
                return View(model);
            }

            if (!userEntity.Status)
            {
                ViewData["error"] = "用户已被禁用，请联系管理员";
                return View(model);
            }

            //登陆授权
            var claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name, userEntity.UserName));
            claims.Add(new Claim(ClaimTypes.NameIdentifier, userEntity.ID.ToString()));
            var indentity = new ClaimsIdentity(claims, "PeacockManageWeb");
            var principal = new ClaimsPrincipal(indentity);
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                principal);

            string redirectAction = Url.Action("Index", "User");
            if (!string.IsNullOrEmpty(HttpContext.Request.Query["ReturnUrl"].FirstOrDefault()))
            {
                redirectAction = HttpContext.Request.Query["ReturnUrl"].FirstOrDefault();
            }
            
            return Redirect(redirectAction);
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return Redirect(Url.Action("Login"));
        }
    }
}