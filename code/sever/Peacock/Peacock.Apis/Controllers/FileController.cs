using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Controllers
{
    [Route("file")]
    public class FileController : ControllerBase
    {
        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="env"></param>
        /// <returns></returns>
        [HttpPost("uploadimg")]
        public ActionResult UploadImg([FromServices]IHostingEnvironment env)
        {
            var apiToken = HttpContext.Request.Form["token"];
            if (string.IsNullOrEmpty(apiToken)) return Unauthorized();

            var files = HttpContext.Request.Form.Files.GetFiles("file");
            var fileBasePath = Path.Combine(env.ContentRootPath, "upload", "img");
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

            return Ok(imageUrl);
        }
    }
}
