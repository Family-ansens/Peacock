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
        private readonly IHostingEnvironment _env;

        public FileController(IHostingEnvironment env)
        {
            _env = env;
        }

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="env"></param>
        /// <returns></returns>
        [HttpPost("uploadimg")]
        public ActionResult UploadImg()
        {
            var apiToken = HttpContext.Request.Form["token"];
            if (string.IsNullOrEmpty(apiToken)) return Unauthorized();

            var files = HttpContext.Request.Form.Files.GetFiles("file");
            var fileBasePath = Path.Combine(_env.ContentRootPath, "upload", "img");
            List<string> fileList = new List<string>();
            string returnPath = string.Empty;
            var returnPaths = new Dictionary<string, string>();

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
                        fileList.Add(Request.Host + "/upload/img/" + fileName);
                        formFile.CopyTo(stream);
                        returnPath = "/upload/img/" + fileName;
                        returnPaths.Add(formFile.FileName, returnPath);
                    }
                }
            }

            return Ok(returnPaths);
        }

        [HttpGet("{filePath}")]
        public ActionResult GetFile(string filePath)
        {
            var fileFullPath = Path.Combine(_env.ContentRootPath, filePath);
            if (!System.IO.File.Exists(fileFullPath)) return NotFound();

            return new FileContentResult(System.IO.File.ReadAllBytes(fileFullPath), "image/jpeg");
        }
    }
}
