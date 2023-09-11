using CinemaApp.Core.Entities;

namespace CinemaApp.App.ViewModels
{
    public class BlogVm
    {
        public Blog? blog { get; set; }
        public List<Comment>? Comments { get; set; }
    }
}
