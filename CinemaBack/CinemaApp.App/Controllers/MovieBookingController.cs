using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    public class MovieBookingController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
