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
    public class Gallery:BaseEntity
    {
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }
    }
}
