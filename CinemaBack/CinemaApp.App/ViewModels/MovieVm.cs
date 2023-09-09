using CinemaApp.App.Entities;

namespace CinemaApp.App.ViewModels
{
    public class MovieVm
    {
        public Movie? movie { get; set; }
        public List<Movie>? RelatedMovies { get; set; }
    }
}
