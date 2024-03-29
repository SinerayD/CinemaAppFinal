﻿using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class BlogTag : BaseEntity
    {
        public int TagId { get; set; }
        public Tag? Tag { get; set; }
        public Blog? Blog { get; set; }
        public int BlogId { get; set; }
    }
}
