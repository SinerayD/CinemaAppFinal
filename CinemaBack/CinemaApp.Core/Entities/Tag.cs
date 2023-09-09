using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Tag : BaseEntity
    {
        [Required]
        public string Name { get; set; }
        public List<BlogTag>? blogTags { get; set; }

    }
}
