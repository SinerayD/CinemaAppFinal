using CinemaApp.App.Entities;
using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CinemaApp.App.Controllers
{
    public class MovieController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public MovieController(CinemaAppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int? id)
        {
            ViewBag.Categories = await _context.Categories.Where(x => !x.IsDeleted)
                .Include(x => x.MovieCategories)
                .ThenInclude(x => x.Movie)
                .ToListAsync();

            if (id == null)
            {
                IEnumerable<Movie> movies = await _context.Movies.Where(x => !x.IsDeleted)
                    .Include(x => x.movieCategories)
                    .ThenInclude(x => x.Category)
                    .Include(x => x.MovieLanguages)
                    .ThenInclude(x => x.Language)
                    .ToListAsync();

                return View(movies);
            }
            else
            {
                IEnumerable<Movie> movies = await _context.Movies.Where(x => !x.IsDeleted)
                    .Include(x => x.movieCategories)
                    .ThenInclude(x => x.Category)
                    .Include(x => x.MovieLanguages)
                    .ThenInclude(x => x.Language)
                    .Where(x => x.MovieLanguages.Any(ml => ml.Language.Id == id))
                    .ToListAsync();

                return View(movies);
            }
        }

        public async Task<IActionResult> Detail(int id)
        {
            ViewBag.Categories = await _context.Categories.Where(x => !x.IsDeleted)
                .Include(x => x.MovieCategories)
                .ThenInclude(x => x.Movie)
                .ToListAsync();

            ViewBag.Languages = await _context.Languages.Where(x => !x.IsDeleted)
                .Include(x => x.MovieLanguages)
                .ThenInclude(x => x.Movie)
                .ToListAsync();

            ViewBag.Movies = await _context.Movies.Where(x => !x.IsDeleted)
                .Include(x => x.movieCategories)
                .ThenInclude(x => x.Category)
                .Include(x => x.MovieLanguages)
                .ThenInclude(x => x.Language)
                .Take(3)
                .ToListAsync();

            Movie movie = await _context.Movies
       .Where(x => x.Id == id && !x.IsDeleted)
       .Include(x => x.movieCategories)
       .ThenInclude(x => x.Category)
       .Include(x => x.MovieLanguages)
       .ThenInclude(x => x.Language)
       .Include(x => x.movieActors)
       .ThenInclude(x => x.Actor)
       .FirstOrDefaultAsync();

            if (movie == null)
            {
                return NotFound(); 
            }

            List<int>? categoryIds = movie.movieCategories.Select(mc => mc.CategoryId).ToList();

            //var relatedMovies = await _context.Movies
      //.Where(x => x.Id != id && !x.IsDeleted)
      //.Include(x => x.movieCategories)
      //.ThenInclude(x => x.Category)
      //.Where(x => x.movieCategories.Any(mc => movie.CategoryIds.Contains(mc.CategoryId)))
     //.ToListAsync();


            MovieVm movieVm = new MovieVm
            {
                movie = movie,
               // RelatedMovies = relatedMovies
            };

            return View(movieVm);
        }

    }
}
