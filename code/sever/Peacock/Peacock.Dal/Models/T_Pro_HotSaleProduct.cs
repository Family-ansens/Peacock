﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Pro_HotSaleProduct
    {
        public int ID { get; set; }

        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }

        public virtual T_Pro_Product Product { get; set; }
    }
}
