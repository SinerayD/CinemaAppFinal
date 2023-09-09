using CinemaApp.Core.Entities.BaseEntities;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations.Schema;

namespace CinemaApp.App.Entities
{
    public class Actor:BaseEntity
    {
        public string FullName { get; set; }
        public string Role { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile? File { get; set; }
        public List<MovieActor>? MovieActors { get; set; }
    }
}
