﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Peacock.Dal
{
    public partial class T_Company
    {
        public int ID { get; set; }

        public string Content { get; set; }

        public int? ContentLanguageId { get; set; }

        public string ImgPath { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedTime { get; set; }

        public string LastUpdatedBy { get; set; }

        public DateTime LastUpdatedTime { get; set; }

        public virtual T_System_LanguageRelation LanguageRelationByContent { get; set; }
    }
}
