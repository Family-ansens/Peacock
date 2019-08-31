using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Peacock.Apis.Common
{
    public class ResponseModel
    {
        public ResponseModel()
        {
        }

        public ResponseModel(object data)
        {
            Data = data;
        }

        public ResponseModel(IEnumerable<ResponseError> errors)
        {
            _errors = errors.ToList();
        }

        public ResponseModel(ResponseError error)
        {
            _errors = new List<ResponseError>() { error };
        }

        private List<ResponseError> _errors;
        public List<ResponseError> Errors => _errors ?? (_errors = new List<ResponseError>());

        public object Data { get; set; }

        public static readonly ResponseModel Success = new ResponseModel();

        public static RawResponseModel Raw(object data) => new RawResponseModel(data);

        public static ResponseModel Error(ResponseError error) => new ResponseModel(error);

        public static ResponseModel Error(string code, string message) =>
            new ResponseModel(new ResponseError(code, message));

        public static ResponseModel ValidateError(string message = "验证错误") =>
            new ResponseModel(new ResponseError("ValidationError", message));

        public static ResponseModel UploadFormatError(string message = "文件格式错误") =>
            new ResponseModel(new ResponseError("FileFormatError", message));

        public static ResponseModel RequiredFileError(string message = "上传错误或者缺少上传文件") =>
            new ResponseModel(new ResponseError("UploadError", message));
    }

    public class ResponseError
    {
        public ResponseError(string code = "", string message = "")
        {
            Code = code;
            Message = message;
        }

        public string Code { get; set; }
        public string Message { get; set; }
    }

    public class RawResponseModel
    {
        public RawResponseModel(object data)
        {
            Data = data;
        }

        public object Data { get; set; }
    }
}
