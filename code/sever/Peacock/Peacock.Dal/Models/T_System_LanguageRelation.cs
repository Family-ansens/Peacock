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
            ProductsWithIntroduction = new HashSet<T_Pro_Product>();
            ProductsWithDescription = new HashSet<T_Pro_Product>();
            NewsWithTitle = new HashSet<T_New>();
            NewsWithContent = new HashSet<T_New>();
            AnnouncementsWithTitle = new HashSet<T_Announcement>();
            AnnouncementsWithContent = new HashSet<T_Announcement>();
            ExampleGroups = new HashSet<T_Pro_ExampleGroup>();
            ExamplesWithName = new HashSet<T_Pro_Example>();
            ExamplesWithDescription = new HashSet<T_Pro_Example>();
            CompaniesWithIntroduction = new HashSet<T_Company>();
            CompaniesWithContent = new HashSet<T_Company>();
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
        public virtual ICollection<T_Pro_Product> ProductsWithIntroduction { get; set; }
        public virtual ICollection<T_Pro_Product> ProductsWithDescription { get; set; }
        public virtual ICollection<T_New> NewsWithTitle { get; set; }
        public virtual ICollection<T_New> NewsWithContent { get; set; }
        public virtual ICollection<T_Announcement> AnnouncementsWithTitle { get; set; }
        public virtual ICollection<T_Announcement> AnnouncementsWithContent { get; set; }
        public virtual ICollection<T_Pro_ExampleGroup> ExampleGroups { get; set; }
        public virtual ICollection<T_Pro_Example> ExamplesWithName { get; set; }
        public virtual ICollection<T_Pro_Example> ExamplesWithDescription { get; set; }
        public virtual ICollection<T_Company> CompaniesWithIntroduction { get; set; }
        public virtual ICollection<T_Company> CompaniesWithContent { get; set; }
    }
}
