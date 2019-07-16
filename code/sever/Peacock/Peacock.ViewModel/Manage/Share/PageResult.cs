using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class PageResult<T> where T : class
    {
        public List<T> List { get; set; }

        public Pager Pager { get; set; }
    }
}
