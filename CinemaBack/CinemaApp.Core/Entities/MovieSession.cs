
using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class MovieSession : BaseEntity
    {
        public int MovieID { get; set; }
        public Movie? Movie { get; set; }
        public int HallID { get; set; }
        public Hall? Hall { get; set; }
        public Venue? Venue { get; set; }
        public int VenueID { get; set; }
        public decimal Price { get; set; }
        public List<MovieDate>? MovieDates { get; set; }
    }
}
