using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Advertise
    {
        public int ID { get; set; }

        public int OrderId { get; set; }

        public string ImgUrl { get; set; }

        public bool IsDeleted { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }
    }
}
