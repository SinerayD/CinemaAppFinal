using CinemaApp.Core.Entities.BaseEntities;
using System;

namespace CinemaApp.App.Entities
{
    public class Venue : BaseEntity
    {
        public string? Name { get; set; }
        public int HallID { get; set; }
        public Hall? Hall { get; set; }
        public List<MovieSession>? MovieSessions { get; set; }
        public List<MovieDate>? MovieDates { get; set; }
    }
}

