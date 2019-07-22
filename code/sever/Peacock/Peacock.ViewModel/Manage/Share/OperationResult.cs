using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class OperationResult
    {
        public string Code { get; set; }

        public bool Success { get; set; }

        public string Message { get; set; }

        public object Content { get; set; }

        public OperationResult(string code, bool success, string message, object content)
        {
            Code = code;
            Success = success;
            Message = message;
            Content = content;
        }
    }
}
