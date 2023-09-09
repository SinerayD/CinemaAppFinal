
using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.App.Entities
{
    public class Language : BaseEntity
    {
        public string Name { get; set; }
        public List<MovieLanguage>? MovieLanguages { get; set; }
    }
}