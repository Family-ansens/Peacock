using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb
{
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

        public ActionResult GetUploadView()
        {
            return View("_Upload");
        }

        [HttpPost]
        public ActionResult UploadImg([FromServices]IHostingEnvironment env)
        {
            var files = HttpContext.Request.Form.Files.GetFiles("file");
            // full path to file in temp location
            var fileBasePath = Path.Combine(env.WebRootPath, "upload", "img");
            List<string> fileList = new List<string>();
            string t = string.Empty;

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
