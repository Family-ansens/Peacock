using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Evaluation
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string Tel { get; set; }

        public string Content { get; set; }

        public string Email { get; set; }

        public string OtherContact { get; set; }

        public string IpAddress { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }
    }
}
