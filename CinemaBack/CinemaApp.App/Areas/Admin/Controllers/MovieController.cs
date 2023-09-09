using CinemaApp.App.Entities;
using CinemaApp.App.Extensions;
using CinemaApp.App.Helpers;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;


namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "SuperAdmin,Admin")]
    public class MovieController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public MovieController(CinemaAppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Movie> movies = await _context.Movies
                .Where(x => !x.IsDeleted)
                .Include(m => m.movieCategories)
                    .ThenInclude(mc => mc.Category)
                .ToListAsync();
            return View(movies);
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            ViewBag.Categories = await _context.Categories
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Actors = await _context.Actors
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Languages = await _context.Languages
                .Where(p => !p.IsDeleted)
                .ToListAsync();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Movie movie)
        {
            ViewBag.Categories = await _context.Categories
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Actors = await _context.Actors
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Languages = await _context.Languages
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            if (!ModelState.IsValid)
            {
                return View(movie);
            }

            if (movie.File is null)
            {
                ModelState.AddModelError("file", "Image must be added");
                return View(movie);
            }

            if (movie.TrailerFile is null)
            {
                ModelState.AddModelError("TrailerFile", "Trailer image must be added");
                return View(movie);
            }

            if (!Helper.isImage(movie.File) || !Helper.isImage(movie.TrailerFile))
            {
                ModelState.AddModelError("file", "File must be an image");
                return View(movie);
            }

            if (!Helper.isSizeOk(movie.File, 1) || !Helper.isSizeOk(movie.TrailerFile, 1))
            {
                ModelState.AddModelError("file", "Size of the image must be less than 1 MB");
                return View(movie);
            }

            foreach (var categoryId in movie.CategoryIds)
            {
                if (!await _context.Categories.AnyAsync(x => x.Id == categoryId))
                {
                    ModelState.AddModelError("", "Invalid Category Id");
                    return View(movie);
                }

                MovieCategory movieCategory = new MovieCategory
                {
                    CreatedAt = DateTime.Now,
                    Movie = movie,
                    CategoryId = categoryId
                };

                await _context.MovieCategories.AddAsync(movieCategory);
            }

            foreach (var actorId in movie.ActorIds)
            {
                if (!await _context.Actors.AnyAsync(x => x.Id == actorId))
                {
                    ModelState.AddModelError("", "Invalid Actor Id");
                    return View(movie);
                }

                MovieActor movieActor = new MovieActor
                {
                    CreatedAt = DateTime.Now,
                    Movie = movie,
                    ActorId = actorId
                };

                await _context.MovieActors.AddAsync(movieActor);
            }

            foreach (var languageId in movie.LanguageIds)
            {
                if (!await _context.Categories.AnyAsync(x => x.Id == languageId))
                {
                    ModelState.AddModelError("", "Invalid Category Id");
                    return View(movie);
                }

                MovieLanguage movieLanguage = new MovieLanguage
                {
                    CreatedAt = DateTime.Now,
                    Movie = movie,
                    LanguageId = languageId
                };

                await _context.MovieLanguages.AddAsync(movieLanguage);
            }

            movie.Image = movie.File.CreateImage(_environment.WebRootPath, "Images/home-page/images/");
            movie.TrailerImage = movie.TrailerFile.CreateImage(_environment.WebRootPath, "Images/movie-detail/images/");
            movie.CreatedAt = DateTime.Now;

            await _context.Movies.AddAsync(movie);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            ViewBag.Categories = await _context.Categories
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Actors = await _context.Actors
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Languages = await _context.Languages
               .Where(p => !p.IsDeleted)
                .ToListAsync();

            Movie? movie = await _context.Movies
                 .Where(x => x.Id == id && !x.IsDeleted)
                 .AsNoTracking()
                 .Include(x => x.movieCategories)
                     .ThenInclude(x => x.Category)
                 .Include(x => x.movieActors)
                     .ThenInclude(x => x.Actor)
                     .Include(x => x.MovieLanguages)
                     .ThenInclude(x => x.Language)
                 .FirstOrDefaultAsync();

            if (movie is null)
            {
                return NotFound();
            }

            return View(movie);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Movie movie)
        {
            ViewBag.Categories = await _context.Categories
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Actors = await _context.Actors
                .Where(p => !p.IsDeleted)
                .ToListAsync();

            ViewBag.Languages = await _context.Languages
                .Where(p => !p.IsDeleted)
                 .ToListAsync();

            Movie? updatedMovie = await _context.Movies
                   .Where(x => x.Id == id && !x.IsDeleted)
                   .AsNoTracking()
                   .Include(x => x.movieCategories)
                    .ThenInclude(x => x.Category)
                   .Include(x => x.movieActors)
                       .ThenInclude(x => x.Actor)
                        .Include(x => x.MovieLanguages)
                       .ThenInclude(x => x.Language)
                   .FirstOrDefaultAsync();

            if (updatedMovie is null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View(updatedMovie);
            }

            if (movie.File is not null)
            {
                if (!Helper.isImage(movie.File))
                {
                    ModelState.AddModelError("file", "File must be an image");
                    return View(movie);
                }
                if (!Helper.isSizeOk(movie.File, 1))
                {
                    ModelState.AddModelError("file", "Size of the image must be less than 1 MB");
                    return View(movie);
                }
                Helper.RemoveImage(_environment.WebRootPath, "Images/movie-detail/images/", updatedMovie.Image);
                movie.Image = movie.File.CreateImage(_environment.WebRootPath, "Images/movie-detail/images/");
            }
            else
            {
                movie.Image = updatedMovie.Image;
                movie.TrailerImage = updatedMovie.TrailerImage;
            }

            List<MovieCategory> removableCategories = await _context.MovieCategories
                .Where(x => !movie.CategoryIds.Contains(x.CategoryId) && x.MovieId == movie.Id)
                .ToListAsync();

            _context.MovieCategories.RemoveRange(removableCategories);

            foreach (var categoryId in movie.CategoryIds)
            {
                if (!_context.MovieCategories.Any(x => x.MovieId == id && x.CategoryId == categoryId))
                {
                    await _context.MovieCategories.AddAsync(new MovieCategory
                    {
                        MovieId = id,
                        CategoryId = categoryId
                    });
                }
            }
            List<MovieActor> removableActor = await _context.MovieActors
               .Where(x => !movie.ActorIds.Contains(x.ActorId))
               .ToListAsync();

            _context.MovieActors.RemoveRange(removableActor);

            foreach (var item in movie.ActorIds)
            {
                if (_context.MovieActors.Where(x => x.MovieId == id && x.ActorId == item).Count() > 0)
                    continue;

                await _context.MovieActors.AddAsync(new MovieActor
                {
                    MovieId = id,
                    ActorId = item
                });

            }
            foreach (var clanguageId in movie.LanguageIds)
            {
                if (!_context.MovieLanguages.Any(x => x.MovieId == id && x.LanguageId == clanguageId))
                {
                    await _context.MovieLanguages.AddAsync(new MovieLanguage
                    {
                        MovieId = id,
                        LanguageId = clanguageId
                    });
                }
            }

            List<MovieLanguage> removableLanguage = await _context.MovieLanguages
                .Where(x => !movie.LanguageIds.Contains(x.LanguageId))
                .ToListAsync();

            _context.MovieLanguages.RemoveRange(removableLanguage);


            updatedMovie.UpdatedAt = DateTime.UtcNow;
            updatedMovie.Name = movie.Name;
            updatedMovie.Description = movie.Description;
            updatedMovie.RunningTime = movie.RunningTime;
            updatedMovie.Director = movie.Director;
            updatedMovie.Rating = movie.Rating;
            updatedMovie.Writer = movie.Writer;
            updatedMovie.VideoUrl = movie.VideoUrl;
            updatedMovie.TrailerImage = movie.TrailerImage;
            updatedMovie.Image = movie.Image;
            updatedMovie.ReleaseDate = movie.ReleaseDate;

            _context.Movies.Update(movie);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            Movie? movie = await _context.Movies.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();

            if (movie == null)
                return NotFound();

            movie.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }
    }
}