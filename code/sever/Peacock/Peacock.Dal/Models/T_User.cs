using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_User
    {
        public int ID { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public bool Status { get; set; }

        public DateTime CreatedTime { get; set; }

        public DateTime LastUpdatedTime { get; set; }
    }
}
