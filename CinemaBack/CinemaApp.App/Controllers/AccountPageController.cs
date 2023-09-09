using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    public class AccountPageController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
