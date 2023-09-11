using CinemaApp.Core.Entities.BaseEntities;
using System.ComponentModel.DataAnnotations;

namespace CinemaApp.Core.Entities
{
    public class Comment : BaseEntity
    {
        public AppUser? AppUser { get; set; }
        public string AppUserId { get; set; }

        public string? Name { get; set; }

        [Required]
        public string? Text { get; set; }

        public Blog? Blog { get; set; }
        public int BlogId { get; set; }
    }
}
