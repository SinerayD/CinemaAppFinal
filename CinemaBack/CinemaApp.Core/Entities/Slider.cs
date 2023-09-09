using CinemaApp.Core.Entities.BaseEntities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Slider:BaseEntity
    {
        public string Title { get; set; }
        public string Writer { get; set; }
        public string Country { get; set; }
        public string Year { get; set; }
        public string MovieGenre { get; set; }
        public string? Image { get; set; }
        public bool IsActive { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }
    }
}
