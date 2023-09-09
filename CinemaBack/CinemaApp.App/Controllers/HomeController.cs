using CinemaApp.App.Entities;
using CinemaApp.App.ViewModels;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Controllers
{
    public class HomeController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public HomeController(CinemaAppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            HomeVm homeVm = new HomeVm();
            homeVm.Sliders= await _context.Sliders.Where(x=>!x.IsDeleted)
                .ToListAsync();
            homeVm.Categories = await _context.Categories.Where(x => !x.IsDeleted)
               .ToListAsync();
            homeVm.Blogs = await _context.Blogs.Where(x => !x.IsDeleted)
               .ToListAsync();
            homeVm.Galleries = await _context.Galleries.Where(x => !x.IsDeleted)
               .ToListAsync();

            homeVm.Movies = await _context.Movies.Where(x => !x.IsDeleted)
                .Include(x => x.MovieLanguages)
                .Include(x => x.movieCategories)
                .ThenInclude(x => x.Category)
               .ToListAsync();
            
            return View(homeVm); 
        }

        //public Task<IActionResult>
        //[HttpGet]
        //[Route("/CommingSoon")]
        //public async Task<IActionResult> CommingSoon()
        //{
        //    _context.Movies.Where(x=> x.IsComming)
        //    return View();
        //}

    }
}