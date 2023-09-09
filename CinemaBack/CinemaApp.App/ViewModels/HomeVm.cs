using CinemaApp.App.Entities;
using CinemaApp.Core.Entities;

namespace CinemaApp.App.ViewModels
{
    public class HomeVm
    {
        public IEnumerable<Slider> Sliders { get; set; }
        public IEnumerable<Category> Categories { get; set; }
        public IEnumerable<Blog> Blogs { get; set; }
        public IEnumerable<Movie> Movies { get; set; }
        public IEnumerable<Gallery> Galleries { get; set; }
    }
}
