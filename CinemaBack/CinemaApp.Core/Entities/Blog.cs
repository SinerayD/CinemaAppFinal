using CinemaApp.Core.Entities.BaseEntities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Blog:BaseEntity
    {
        public string? Image { get; set; }  
        public string Title { get; set; }
        public string Description { get; set; }
        public List<BlogTag>? BlogTags { get; set; }
        public List<BlogCategory>? BlogCategories { get; set; }
        public List<Comment>? Comments { get; set; }
        [NotMapped]
        public List<int> CategoryIds { get; set; }
        [NotMapped]
        public List<int> TagIds { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }

    }
}
