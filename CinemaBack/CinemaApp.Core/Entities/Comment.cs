using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Comment : BaseEntity
    {
        public string? Name { get; set; }
        public string? Text { get; set; }
        public Blog blog { get; set; }
        public int BlogtId { get; set; }
    }
}
