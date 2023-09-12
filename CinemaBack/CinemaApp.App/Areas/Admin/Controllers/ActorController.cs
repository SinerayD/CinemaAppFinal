using CinemaApp.App.Entities;
using CinemaApp.App.Extensions;
using CinemaApp.App.Helpers;
using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ActorController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public ActorController(CinemaAppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        public async Task<IActionResult> Index()

        {
            IEnumerable<Actor> actors = await _context.Actors.Where(x => !x.IsDeleted).ToListAsync();
            return View(actors);
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Actor actor)
        {
            if (!ModelState.IsValid)
            {
                return View(actor);
            }

            if (actor.File is null)
            {
                ModelState.AddModelError("file", "Image must be added");
                return View(actor);
            }
            if (!Helper.isImage(actor.File))
            {
                ModelState.AddModelError("file", "File must be image");
                return View(actor);
            }
            if (!Helper.isSizeOk(actor.File, 1))
            {
                ModelState.AddModelError("file", "Size of Image must less than 1 mb!!!");
                return View(actor);
            }
            actor.Image = actor.File.CreateImage(_environment.WebRootPath, "Images/movie-detail/images/");
            actor.CreatedAt = DateTime.Now;

            await _context.AddAsync(actor);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            Actor? actor = await _context.Actors.
                Where(x => !x.IsDeleted && x.Id == id).
                FirstOrDefaultAsync();

            if (actor == null)
                return NotFound();

            return View(actor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Actor updatedActor)
        {
            Actor? actor = await _context.Actors.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();

            if (updatedActor is null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View(updatedActor);
            }

            if (actor.File is not null)
            {
                if (!Helper.isImage(actor.File))
                {
                    ModelState.AddModelError("file", "File must be an image");
                    return View(actor);
                }
                if (!Helper.isSizeOk(actor.File, 1))
                {
                    ModelState.AddModelError("file", "Size of the image must be less than 1 MB");
                    return View(actor);
                }
                Helper.RemoveImage(_environment.WebRootPath, "Images/movie-detail/images/", updatedActor.Image);
                actor.Image = actor.File.CreateImage(_environment.WebRootPath, "Images/movie-detail/images/");
            }
            else
            {
                actor.Image = updatedActor.Image;
            }

            actor.FullName = updatedActor.FullName;
            actor.Role = updatedActor.Role;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            Actor? actor = await _context.Actors.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();

            if (actor == null)
                return NotFound();

            actor.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }
    }
}
