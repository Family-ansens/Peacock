using System;
using System.Collections.Generic;

namespace Peacock.Dal
{
    public partial class T_System_LanguageRelation
    {
        public T_System_LanguageRelation()
        {
            TSystemLanguageContent = new HashSet<T_System_LanguageContent>();
            TSystemMenu = new HashSet<T_System_Menu>();
            T_Pro_ProductGroups = new HashSet<T_Pro_ProductGroup>();
            ProductsWithName = new HashSet<T_Pro_Product>();
            ProductsWithDescription = new HashSet<T_Pro_Product>();
        }

        public int Id { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedTime { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate { get; set; }

        public virtual ICollection<T_System_LanguageContent> TSystemLanguageContent { get; set; }
        public virtual ICollection<T_System_Menu> TSystemMenu { get; set; }
        public virtual ICollection<T_Pro_ProductGroup> T_Pro_ProductGroups { get; set; }
        public virtual ICollection<T_Pro_Product> ProductsWithName { get; set; }
        public virtual ICollection<T_Pro_Product> ProductsWithDescription { get; set; }
    }
}
