using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

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
        /// <returns></returns>
        [HttpPost("uploadimg")]
        public ActionResult UploadImg()
        {
            var apiToken = HttpContext.Request.Form["token"];
            if (string.IsNullOrEmpty(apiToken)) return Unauthorized();
            var fileSeverUrl = Request.IsHttps ? $"https://{Request.Host}/file" : $"http://{Request.Host}/file";

            DateTime today = DateTime.Today;
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
                    string fileName = $"{today.Year}{today.Month}{today.Day}-{Guid.NewGuid().ToString().Replace("-", string.Empty)}.{fileExtension}";
                    string fileFullPath = Path.Combine(fileBasePath, fileName);
                    using (var stream = new FileStream(fileFullPath, FileMode.CreateNew))
                    {
                        fileList.Add(Request.Host + "/upload/img/" + fileName);
                        formFile.CopyTo(stream);
                        returnPath = "/img/" + fileName;
                        returnPaths.Add(formFile.FileName, returnPath);
                    }
                }
            }

            Hashtable result = new Hashtable();
            result.Add("link", $"{fileSeverUrl}{returnPath}");
            return new JsonResult(result);
            //return Ok(returnPaths);
        }

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <returns></returns>
        [HttpPost("cloud-uploadimg")]
        public ActionResult CloudUploadImg()
        {
            var apiToken = HttpContext.Request.Form["token"];
            if (string.IsNullOrEmpty(apiToken)) return Unauthorized();
            var fileSeverUrl = Request.IsHttps ? $"https://{Request.Host}/file" : $"http://{Request.Host}/file";

            DateTime today = DateTime.Today;
            var fileContent = HttpContext.Request.Form["base64"];
            if (string.IsNullOrEmpty(fileContent)) return new JsonResult(new object());

            var buffer = Convert.FromBase64String(fileContent.ToString());

            var fileBasePath = Path.Combine(_env.ContentRootPath, "upload", "img");
            List<string> fileList = new List<string>();
            string returnPath = string.Empty;

            string uploadPath = HttpContext.Request.Form["uploadPath"];
            if (!string.IsNullOrEmpty(uploadPath)) fileBasePath = Path.Combine(fileBasePath, uploadPath);
            if (!Directory.Exists(fileBasePath)) Directory.CreateDirectory(fileBasePath);

            string fileExtension = HttpContext.Request.Form["suffixType"];
            string fileName = $"{today.Year}{today.Month}{today.Day}-{Guid.NewGuid().ToString().Replace("-", string.Empty)}.{fileExtension}";
            string fileFullPath = Path.Combine(fileBasePath, fileName);
            using (var stream = new FileStream(fileFullPath, FileMode.CreateNew))
            {
                stream.Write(buffer, 0, buffer.Length);
                fileList.Add(Request.Host + "/upload/img/" + fileName);
                returnPath = "/img/" + fileName;
            }

            Hashtable uploadResponse = new Hashtable();
            uploadResponse.Add("link", $"{fileSeverUrl}{returnPath}");

            return new JsonResult(uploadResponse);
        }

        /// <summary>
        /// 获取图片
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        [HttpGet("img/{fileName}")]
        public ActionResult GetFile(string fileName)
        {
            var fileFullPath = Path.Combine(_env.ContentRootPath, "upload", "img", fileName);
            string fileExtension = fileName.Split('.').Last().ToLower();
            if (!System.IO.File.Exists(fileFullPath)) return NotFound();

            string contentType = $"image/{fileExtension}";
            return new FileContentResult(System.IO.File.ReadAllBytes(fileFullPath), contentType);
        }
    }
}
