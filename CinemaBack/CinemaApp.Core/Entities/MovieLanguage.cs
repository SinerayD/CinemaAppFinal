using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class MovieLanguage : BaseEntity
    {
        public int MovieId { get; set; }
        public Movie? Movie { get; set; }

        public int LanguageId { get; set; }
        public Language? Language { get; set; }
    }
}
