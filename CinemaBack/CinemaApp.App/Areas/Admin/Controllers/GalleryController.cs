using CinemaApp.App.Entities;
using CinemaApp.App.Extensions;
using CinemaApp.App.Helpers;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "SuperAdmin,Admin")]
    public class GalleryController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public GalleryController(CinemaAppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }
        public async Task<IActionResult> Index()
        {

            IEnumerable<Gallery> galleries = await _context.Galleries.Where(x => !x.IsDeleted).ToListAsync();
            return View(galleries);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Gallery gallery)
        {
            if (!ModelState.IsValid)
            {
                return View(gallery);
            }

            if (gallery.File is null)
            {
                ModelState.AddModelError("file", "Image must be added");
                return View(gallery);
            }
            if (!Helper.isImage(gallery.File))
            {
                ModelState.AddModelError("file", "File must be image");
                return View(gallery);
            }
            if (!Helper.isSizeOk(gallery.File, 1))
            {
                ModelState.AddModelError("file", "Size of Image must be less than 1 MB!!!");
                return View(gallery);
            }
            gallery.Image = gallery.File.CreateImage(_environment.WebRootPath, "Images/home-page/images/");
            gallery.CreatedAt = DateTime.Now;

            await _context.AddAsync(gallery);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            Gallery? gallery = await _context.Galleries.
                Where(x => !x.IsDeleted && x.Id == id).
                FirstOrDefaultAsync();

            if (gallery == null)
                return NotFound();

            return View(gallery);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Gallery updatedGallery)
        {
            Gallery? gallery = await _context.Galleries.
                Where(x => !x.IsDeleted && x.Id == id).
                FirstOrDefaultAsync();

            if (updatedGallery is null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View(updatedGallery);
            }

            if (gallery.File is not null)
            {
                if (!Helper.isImage(gallery.File))
                {
                    ModelState.AddModelError("file", "File must be an image");
                    return View(updatedGallery);
                }
                if (!Helper.isSizeOk(gallery.File, 1))
                {
                    ModelState.AddModelError("file", "Size of the image must be less than 1 MB");
                    return View(gallery);
                }
                if (!string.IsNullOrWhiteSpace(updatedGallery.Image))
                {
                    Helper.RemoveImage(_environment.WebRootPath, "Images/home-page/images/", updatedGallery.Image);
                }
                gallery.Image = gallery.File.CreateImage(_environment.WebRootPath, "Images/home-page/images/");
            }
            else
            {
                gallery.Image = updatedGallery.Image;
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            Gallery? gallery = await _context.Galleries.
               Where(x => !x.IsDeleted && x.Id == id).
               FirstOrDefaultAsync();

            if (gallery == null)
                return NotFound();

            gallery.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }
    }
}
