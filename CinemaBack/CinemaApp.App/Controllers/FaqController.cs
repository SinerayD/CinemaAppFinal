using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    public class FaqController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
