using CinemaApp.Core.Entities.BaseEntities;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Xml.Linq;

namespace CinemaApp.App.Entities
{
    public class Movie:BaseEntity
    {
        public string Name { get; set; }
        public int RunningTime { get; set; }
        public DateTime ReleaseDate { get; set; }
        public string Director { get; set; }
        public string Rating { get; set; }
        public string Writer { get; set; }
        public string Description { get; set; }
        public string VideoUrl { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; }
        public string? Image { get; set; }
        public string? TrailerImage { get; set; }
        public List<MovieCategory>? movieCategories { get; set; }
        public List<MovieActor>? movieActors { get; set; }
        public List<MovieLanguage>? MovieLanguages { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }
        [NotMapped]
        public IFormFile? TrailerFile { get; set; }
        [NotMapped]
        public List<int> CategoryIds { get; set; }
        [NotMapped]
        public List<int> ActorIds { get; set; }
        [NotMapped]
        public List<int> LanguageIds { get; set; }
    }
}
