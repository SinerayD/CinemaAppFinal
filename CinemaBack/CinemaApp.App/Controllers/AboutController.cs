using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
