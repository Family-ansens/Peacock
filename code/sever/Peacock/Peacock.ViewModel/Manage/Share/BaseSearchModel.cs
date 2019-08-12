using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class BaseSearchModel
    {
        public int limit { get; set; }

        public int offset { get; set; }

        public string order { get; set; }

        public string orderName { get; set; }

        public string search { get; set; }
    }
}
