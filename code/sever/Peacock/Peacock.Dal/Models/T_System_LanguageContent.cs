using System;
using System.Collections.Generic;

namespace Peacock.Dal
{
    public partial class T_System_LanguageContent
    {
        public int Id { get; set; }
        public int RelationId { get; set; }
        public string LanguageType { get; set; }
        public string DisplayContent { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedTime { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedTime { get; set; }

        public virtual T_System_LanguageRelation Relation { get; set; }
    }
}
