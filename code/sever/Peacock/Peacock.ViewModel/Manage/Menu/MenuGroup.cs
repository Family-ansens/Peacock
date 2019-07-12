using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class MenuGroup
    {
        public string Code { get; set; }

        public string Name { get; set; }

        public int Seq { get; set; }

        public List<MenuItem> MenuItems { get; set; }

        public MenuGroup(string code, int seq, string name, List<MenuItem> menuItems)
        {
            Code = code;
            Seq = seq;
            Name = name;
            MenuItems = menuItems;
        }
    }
}
