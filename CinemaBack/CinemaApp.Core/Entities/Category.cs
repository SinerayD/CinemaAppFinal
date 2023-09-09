using CinemaApp.App.Entities;
using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Category:BaseEntity
    {
        public string Name { get; set; }
        public List<MovieCategory>? MovieCategories { get; set; }
        public List<BlogCategory>? blogCategories { get; set; }

    }
}
