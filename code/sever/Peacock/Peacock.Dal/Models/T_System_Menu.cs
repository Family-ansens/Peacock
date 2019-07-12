using System;
using System.Collections.Generic;

namespace Peacock.Dal
{
    public partial class T_System_Menu
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public int Seq { get; set; }
        public int? LanguageRelationId { get; set; }
        public bool IsDeleted { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedTime { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate { get; set; }

        public virtual T_System_LanguageRelation LanguageRelation { get; set; }
    }
}
