using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ManageWeb.Models;
using Peacock.ViewModel.Manage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.ManageWeb.Controllers
{
    [Authorize]
    public class UserController : BaseController
    {
        private const string DEFAULT_PASSWORD = "123456";

        public UserController(PeacockDbContext peacockDbContext) : base(peacockDbContext)
        {

        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetList(BaseSearchModel searchModel)
        {
            int count = peacockDbContext.T_User.Count();
            var list = peacockDbContext.T_User.Skip(searchModel.offset).Take(searchModel.limit).ToList();
            return Json(new { total = count, rows = list });
        }

        [HttpPost]
        public JsonResult ResetPwd(int id)
        {
            string pwd = BaseIdentityService.HashPassword(DEFAULT_PASSWORD);
            var entity = peacockDbContext.T_User.FirstOrDefault(i => i.ID == id);
            if (entity == null)
            {
                return Json(Fail("无效用户"));
            }
            entity.Password = pwd;
            entity.LastUpdatedTime = DateTime.Now;
            peacockDbContext.Update(entity);
            peacockDbContext.SaveChanges();
            return Json(Success($"已将{entity.UserName}的密码重置为默认密码"));
        }

        [HttpPost]
        public JsonResult SwitchStatus(int id)
        {
            var entity = peacockDbContext.T_User.FirstOrDefault(i => i.ID == id);
            if (entity == null)
            {
                return Json(Fail("无效用户"));
            }
            entity.Status = !entity.Status;
            entity.LastUpdatedTime = DateTime.Now;
            peacockDbContext.Update(entity);
            peacockDbContext.SaveChanges();
            string actionText = entity.Status ? "启用" : "禁用";
            return Json(Success($"已{actionText}用户{entity.UserName}"));
        }

        public IActionResult Edit(int id)
        {
            var entity = peacockDbContext.T_User.FirstOrDefault(i => i.ID == id);
            if (entity == null)
            {
                return View(new UserModel());
            }
            var model = new UserModel()
            {
                ID = entity.ID,
                UserName = entity.UserName,
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Save(UserModel model)
        {
            if (!ModelState.IsValid)
            {
                return PartialView("Edit", model);
            }
            if (!model.Password.Equals(model.ConfirmPassword))
            {
                ModelState.AddModelError("Password", "两次密码输入不相同");
                ModelState.AddModelError("ConfirmPassword", string.Empty);
                return PartialView("Edit", model);
            }

            bool isExists = peacockDbContext.T_User.Any(i => i.UserName == model.UserName);
            if (isExists)
            {
                ModelState.AddModelError("UserName", "用户名已存在");
                return PartialView("Edit", model);
            }

            var entity = new T_User()
            {
                UserName = model.UserName,
                Password = BaseIdentityService.HashPassword(model.Password),
                Status = true,
                CreatedTime = DateTime.Now,
                LastUpdatedTime = DateTime.Now,
            };
            peacockDbContext.T_User.Add(entity);
            peacockDbContext.SaveChanges();
            return Json(Success("创建用户成功"));
        }

        [HttpGet]
        public IActionResult ChangePwd()
        {
            return PartialView(new ChangePwdModel());
        }

        [HttpPost]
        public IActionResult ChangePwd(ChangePwdModel model)
        {
            if (!ModelState.IsValid)
            {
                return PartialView(model);
            }

            if (!model.ConfirmPassword.Equals(model.Password))
            {
                ModelState.AddModelError("Password", "两次密码输入不一致");
                ModelState.AddModelError("ConfirmPassword", "");
                return PartialView(model);
            }

            if (model.OldPassword.Equals(model.Password))
            {
                ModelState.AddModelError("Password", "旧密码和新密码完全一致");
                ModelState.AddModelError("ConfirmPassword", "");
                ModelState.AddModelError("OldPassword", "");
                return PartialView(model);
            }

            var oldPwd = BaseIdentityService.HashPassword(model.OldPassword);
            var entity = peacockDbContext.T_User.FirstOrDefault(i => i.ID == userId && i.Password == oldPwd);
            if (entity == null)
            {
                ModelState.AddModelError("OldPassword", "旧密码错误");
                return PartialView(model);
            }

            var newPwd = BaseIdentityService.HashPassword(model.Password);
            entity.Password = newPwd;
            entity.LastUpdatedTime = DateTime.Now;
            peacockDbContext.Update(entity);
            peacockDbContext.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
