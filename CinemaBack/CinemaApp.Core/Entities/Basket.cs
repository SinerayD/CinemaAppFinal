using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class Basket : BaseEntity
    {
        public string? AppUserId { get; set; }
        public AppUser? AppUser { get; set; }
        public List<BasketItem>? BasketItems { get; set; }
    }
}
