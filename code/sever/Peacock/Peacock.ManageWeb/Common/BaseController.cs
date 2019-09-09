using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Peacock.Dal;
using Peacock.ViewModel.Manage;

namespace Peacock.ManageWeb
{
    [Authorize]
    public class BaseController : Controller
    {
        protected readonly PeacockDbContext peacockDbContext;
        public string userName
        {
            get
            {
                if (string.IsNullOrEmpty(_userName))
                {
                    _userName = User?.Identity?.Name ?? string.Empty;
                }
                return _userName;
            }
        }
        private string _userName;

        private int _userId;
        public int userId
        {
            get
            {
                if (_userId == 0)
                {
                    var id = User.Claims.FirstOrDefault(i => i.Type == ClaimTypes.NameIdentifier).Value;
                    _userId = int.Parse(id);
                }
                return _userId;
            }
        }

        public BaseController(PeacockDbContext peacockDbContext)
        {
            this.peacockDbContext = peacockDbContext;
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
        public ActionResult UploadImg([FromServices]IHostingEnvironment env, [FromServices]IConfiguration config)
        {
            var files = HttpContext.Request.Form.Files.GetFiles("file");
            string uploadPath = HttpContext.Request.Form["uploadPath"];
            string returnFilePath = string.Empty;
            Dictionary<string, string> returnFileDict = new Dictionary<string, string>();

            string apiUrl = config["ApiUrl"];
            string remoteUploadUrl = apiUrl + "/file/uploadimg";
            string apiToken = config["ApiToken"];

            foreach (var formFile in files)
            {
                if (formFile.Length > 0)
                {
                    string fileExtension = formFile.FileName.Split('.').Last();
                    using (var ms = new MemoryStream())
                    {
                        formFile.CopyTo(ms);

                        var content = new byte[ms.Length];
                        ms.Write(content, 0, (int)ms.Length);

                        
                        var httpClient = new HttpClient();

                        using (var multiContent = new MultipartFormDataContent())
                        {
                            var fileContent = new ByteArrayContent(content);
                            multiContent.Add(fileContent, "file", Path.GetFileName(formFile.FileName));
                            multiContent.Add(new StringContent(apiToken), "token");

                            HttpResponseMessage response = httpClient.PostAsync(remoteUploadUrl, multiContent).Result;
                            returnFileDict = JsonConvert.DeserializeObject<Dictionary<string, string>>(response.Content.ReadAsStringAsync().Result);
                        }

                        returnFilePath = apiUrl + "/file" + returnFileDict[formFile.FileName];
                    }

                }
            }

            Hashtable imageUrl = new Hashtable();
            imageUrl.Add("link", returnFilePath);

            return Json(imageUrl);
        }
    }
}
