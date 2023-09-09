using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class Hall : BaseEntity
    {
        public string Name { get; set; }
        public List<Venue>? Venues { get; set; }
        public List<MovieSession>? MovieSessions { get; set; }
        public List<MovieDate>? MovieDates { get; set; }
    }
}
