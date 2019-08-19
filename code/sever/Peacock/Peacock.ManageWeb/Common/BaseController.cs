using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb
{
    [Authorize]
    public class BaseController : Controller
    {
        protected readonly PeacockDbContext peacockDbContext;
        protected readonly string userName;

        public BaseController(PeacockDbContext peacockDbContext)
        {
            this.peacockDbContext = peacockDbContext;
            userName = User?.Identity?.Name ?? string.Empty;
        }

        protected T_System_LanguageContent CreateLanguageContentEntity(string content, string languageType)
        {
            DateTime dtNow = DateTime.Now;
            T_System_LanguageContent entity = new T_System_LanguageContent();
            entity.DisplayContent = content;
            entity.LanguageType = languageType;
            entity.CreatedBy = userName;
            entity.CreatedTime = dtNow;
            entity.LastUpdatedBy = userName;
            entity.LastUpdatedTime = dtNow;
            return entity;
        }

        protected T_System_LanguageRelation EditLanguageContent(T_System_LanguageRelation relation, Dictionary<string, string> languageContentDict)
        {
            DateTime dtNow = DateTime.Now;
            if (relation == null)
            {
                relation = new T_System_LanguageRelation()
                {
                    CreatedBy = userName,
                    CreatedTime = dtNow,
                    LastUpdatedBy = userName,
                    LastUpdatedDate = dtNow,
                };
            }
            foreach(var item in languageContentDict)
            {
                var content = relation.TSystemLanguageContent.FirstOrDefault(i => i.LanguageType == item.Key);
                if (content == null)
                {
                    relation.TSystemLanguageContent.Add(CreateLanguageContentEntity(item.Value ?? string.Empty, item.Key));
                }
                else
                {
                    content.DisplayContent = item.Value ?? string.Empty;
                    content.LastUpdatedBy = userName;
                    content.LastUpdatedTime = dtNow;
                }
            }
            return relation;
        }

        protected string GetLanguageContent(T_System_LanguageRelation r, string languageType)
        {
            return r?.TSystemLanguageContent?.FirstOrDefault(i => i.LanguageType == languageType)?.DisplayContent ?? string.Empty;
        }

        protected OperationResult Success(string message = "", object content = null)
        {
            OperationResult operationResult = new OperationResult("0", true, message, content);
            return operationResult;
        }

        protected OperationResult Fail(string message = "", object content = null)
        {
            OperationResult operationResult = new OperationResult("-1", false, message, content);
            return operationResult;
        }

        public ActionResult GetUploadView(string path)
        {
            ViewData["uploadPath"] = path;
            return PartialView("_Upload");
        }

        [HttpPost]
        public ActionResult UploadImg([FromServices]IHostingEnvironment env)
        {
            var files = HttpContext.Request.Form.Files.GetFiles("file");
            var fileBasePath = Path.Combine(env.WebRootPath, "upload", "img");
            List<string> fileList = new List<string>();
            string t = string.Empty;

            string uploadPath = HttpContext.Request.Form["uploadPath"];
            if (!string.IsNullOrEmpty(uploadPath)) fileBasePath = Path.Combine(fileBasePath, uploadPath);
            if (!Directory.Exists(fileBasePath)) Directory.CreateDirectory(fileBasePath);

            foreach (var formFile in files)
            {
                if (formFile.Length > 0)
                {
                    string fileExtension = formFile.FileName.Split('.').Last();
                    string fileName = Guid.NewGuid().ToString().Replace("-", string.Empty) + "." + fileExtension;
                    string fileFullPath = Path.Combine(fileBasePath, fileName);
                    using (var stream = new FileStream(fileFullPath, FileMode.CreateNew))
                    {
                        //fileList.Add(fileName);
                        fileList.Add(Request.Host + "/upload/img/" + fileName);
                        formFile.CopyTo(stream);
                        t = "/upload/img/" + fileName;
                    }
                }
            }

            // process uploaded files
            // Don't rely on or trust the FileName property without validation.

            Hashtable imageUrl = new Hashtable();
            imageUrl.Add("link", t);

            return Json(imageUrl);
            //return Ok(new { count = files.Count, size, fileList });
        }
    }
}
