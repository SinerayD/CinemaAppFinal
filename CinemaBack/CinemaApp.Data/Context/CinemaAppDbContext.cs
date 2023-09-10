using CinemaApp.App.Entities;
using CinemaApp.Core.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.Data.Context
{
    public class CinemaAppDbContext : IdentityDbContext<AppUser>
    {
        public DbSet<Category> Categories { get; set;}
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Actor> Actors { get; set; }
        public DbSet<MovieActor> MovieActors { get; set; }
        public DbSet<MovieCategory> MovieCategories { get; set; }
        public DbSet<MovieLanguage> MovieLanguages { get; set; }
        public DbSet<Language> Languages { get; set; }
        public DbSet<Slider> Sliders { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<ContactMessage> ContactMessages { get; set; }
        public DbSet<Subscribe> Subscribes { get; set; }
        public DbSet<BlogTag> BlogTags { get; set; }
        public DbSet<BlogCategory> BlogCategories { get; set; }
        public DbSet<Gallery> Galleries { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public CinemaAppDbContext(DbContextOptions<CinemaAppDbContext> options) : base(options)
        {

        }
    }
}
