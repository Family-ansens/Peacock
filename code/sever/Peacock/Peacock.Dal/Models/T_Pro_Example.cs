using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public class T_Pro_Example
    {
        public T_Pro_Example()
        {
            ExampleImgs = new HashSet<T_Pro_ExampleImg>();
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

        public virtual T_Pro_ExampleGroup ExampleGourp { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByName { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByIntroduction { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByDescription { get; set; }

        public HashSet<T_Pro_ExampleImg> ExampleImgs { get; set; }

        public HashSet<T_Pro_ExampleProductRelation> ExampleProductRelations { get; set; }
    }
}
