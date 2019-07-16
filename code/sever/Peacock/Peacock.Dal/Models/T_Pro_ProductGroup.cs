using System;
using System.Collections.Generic;

namespace Peacock.Dal
{
    public partial class T_Pro_ProductGroup
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int OrderId { get; set; }
        public int? LanguageId { get; set; }
        public bool IsDeleted { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedTime { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedTime { get; set; }

        public virtual T_System_LanguageRelation LanguageRelation { get; set; }
    }
}
