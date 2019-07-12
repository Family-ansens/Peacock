using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class MenuItem
    {
        public int Seq { get; set; }

        public string Name { get; set; }

        public string Url { get; set; }

        public MenuItem(string name, string url, int seq)
        {
            Name = name;
            Url = url;
            Seq = seq;
        }
    }
}
