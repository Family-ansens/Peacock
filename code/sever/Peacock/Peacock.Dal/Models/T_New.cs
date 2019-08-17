using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public partial class T_New
    {
        public int ID { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public int? TitleLanguageId { get; set; }

        public int? ContentLanguageId { get; set; }

        public bool IsDeleted { get; set; }

        public bool IsPublish { get; set; }

        public DateTime? PublishTime { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByTitle { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByContent { get; set; }
    }
}
