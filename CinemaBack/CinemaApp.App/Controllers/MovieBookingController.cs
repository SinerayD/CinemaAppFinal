using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Controllers
{
    public class MovieBookingController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public MovieBookingController(CinemaAppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            var movies = await _context.Movies.Where(x => !x.IsDeleted).ToListAsync();
            return View(movies);
        }
    }
}