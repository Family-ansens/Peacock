using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class Pager
    {
        public int PageSize { get; set; }

        public int PageNumber { get; set;}

        public int CurrentNumber { get; set; }

        public int Total { get; set; }
    }
}
