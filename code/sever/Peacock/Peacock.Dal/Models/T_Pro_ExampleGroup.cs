using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Pro_ExampleGroup
    {
        public T_Pro_ExampleGroup()
        {
            Examples = new HashSet<T_Pro_Example>();
        }

        public int ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int OrderId { get; set; }
        public int? LanguageId { get; set; }
        public bool IsDeleted { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedTime { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdatedTime { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByName { get; set; }

        public ICollection<T_Pro_Example> Examples { get; set; }
    }
}
