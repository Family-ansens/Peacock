using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Peacock.ManageWeb
{
    public class CloudUploadService
    {
        private readonly IConfiguration _config;

        public CloudUploadService(IConfiguration config)
        {
            _config = config;
        }

        public string UploadImg2Cloud(CloudUploadImgModel model)
        {
            var file = model.File;
            var uploadUrl = $"{_config["ApiUrl"]}/file/cloud-uploadimg";
            var apiToken = _config["ApiToken"];
            var extension = file.FileName.Split(".").Last();

            var stream = file.OpenReadStream();
            byte[] buffer = new byte[file.Length];
            //读取图片字节流
            stream.Read(buffer, 0, Convert.ToInt32(file.Length));
            //将字节流转化成base64字符串
            var base64 = Convert.ToBase64String(buffer);

            string responseString = string.Empty;

            using (var ms = new MemoryStream())
            {
                var httpClient = new HttpClient();

                using (var multiContent = new MultipartFormDataContent())
                {
                    multiContent.Add(new StringContent(extension), "suffixType");
                    multiContent.Add(new StringContent(base64), "base64");
                    multiContent.Add(new StringContent(apiToken), "token");

                    HttpResponseMessage response = httpClient.PostAsync(uploadUrl, multiContent).Result;
                    responseString = response.Content.ReadAsStringAsync().Result;
                }
            }

            var jobj = JObject.Parse(responseString);
            return jobj["link"].ToString();
        }
    }

    public class CloudUploadImgModel
    {
        public IFormFile File { get; set; }
    }
}
