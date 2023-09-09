using CinemaApp.Core.Entities;
using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class MovieCategory:BaseEntity
    {
        public int MovieId { get; set; }
        public Movie? Movie { get; set; }

        public int CategoryId { get; set; }
        public Category? Category { get; set; }
    }
}
