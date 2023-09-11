using CinemaApp.App.Entities;
using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class BasketItem : BaseEntity
    {
        public int Id { get; set; }
        public int? MovieId { get; set; }
        public Movie? Movie { get; set; }
        public int? BasketId { get; set; }
        public Basket? Basket { get; set; }
        public int Quantity { get; set; }
    }
}
