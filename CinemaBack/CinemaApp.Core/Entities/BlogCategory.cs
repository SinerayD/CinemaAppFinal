using CinemaApp.Core.Entities.BaseEntities;

namespace CinemaApp.Core.Entities
{
    public class BlogCategory : BaseEntity
    {
        public int CategoryId { get; set; }
        public int BlogId { get; set; }
        public Category? Category { get; set; }
        public Blog? Blog { get; set; }
    }
}
