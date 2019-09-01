using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public partial class T_Pro_Product
    {
        public T_Pro_Product()
        {
            ProductImgs = new HashSet<T_Pro_ProductImg>();
            HotSaleProducts = new HashSet<T_Pro_HotSaleProduct>();
            ExampleProductRelations = new HashSet<T_Pro_ExampleProductRelation>();
        }

        public int ID { get; set; }

        public int GroupId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public int OrderId { get; set; }

        public int? NameLanguageId { get; set; }

        public int? IntroductionLanguageId { get; set; }

        public int? DescriptionLanguageId { get; set; }

        public string ImgPath { get; set; }

        public bool IsDeleted { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }

        public virtual T_Pro_ProductGroup ProductGourp { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByName { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByIntroduction { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByDescription { get; set; }

        public HashSet<T_Pro_ProductImg> ProductImgs { get; set; }

        public HashSet<T_Pro_HotSaleProduct> HotSaleProducts { get; set; }

        public HashSet<T_Pro_ExampleProductRelation> ExampleProductRelations { get; set; }
    }
}
