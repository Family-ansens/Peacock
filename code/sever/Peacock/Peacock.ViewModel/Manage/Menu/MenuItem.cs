using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class MenuItem
    {
        public int Id { get; set; }

        public int ParentId { get; set; }

        public int Seq { get; set; }

        public string Name { get; set; }

        public string Url { get; set; }

        public MenuItem Parent { get; set; }

        public List<MenuItem> Children { get; set; }
    }
}
