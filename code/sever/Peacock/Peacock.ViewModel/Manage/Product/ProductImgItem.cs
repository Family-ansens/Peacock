using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.ViewModel.Manage
{
    public class ProductImgItem
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public int? OrderId { get; set; }

        public string ImgUrl { get; set; }
    }
}
