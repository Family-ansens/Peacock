using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Pro_ExampleProductRelation
    {
        public int ID { get; set; }

        public int ProductId { get; set; }

        public int ExampleId { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }

        public virtual T_Pro_Example Example { get; set; }

        public virtual T_Pro_Product Product { get; set; }
    }
}
