using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class MovieDate : BaseEntity
    {
        public DateTime ScheduleDate { get; set; }

        public int VenueID { get; set; }
        public Venue? Venue { get; set; }

        public int HallID { get; set; }
        public Hall? Hall { get; set; }

        public int MovieSessionID { get; set; }
        public MovieSession? MovieSession { get; set; }
    }
}