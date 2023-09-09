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
    public class SliderController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public SliderController(CinemaAppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Slider> sliders = await _context.Sliders.Where(x => !x.IsDeleted)
                 .ToListAsync();
            return View(sliders);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Slider slider)
        {
            if (!ModelState.IsValid)
            {
                return View(slider);
            }
            if (slider.File is null)
            {
                ModelState.AddModelError("file", "Image must be added");
                return View(slider);
            }
            if (!Helper.isImage(slider.File))
            {
                ModelState.AddModelError("file", "File must be image");
                return View(slider);
            }
            if (!Helper.isSizeOk(slider.File, 1))
            {
                ModelState.AddModelError("file", "Size of Image must less than 1 mb!!!");
                return View(slider);
            }
            slider.Image = slider.File.CreateImage(_environment.WebRootPath, "Images/home-page/images/");
            slider.CreatedAt = DateTime.Now;
            await _context.AddAsync(slider);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            Slider? slider = await _context.Sliders.Where(x => x.Id == id && !x.IsDeleted)
             .FirstOrDefaultAsync();
            if (slider is null)
            {
                return NotFound();
            }
            return View(slider);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Slider slider)
        {
            Slider? updatedSlider = await _context.Sliders
                .Where(x => x.Id == id && !x.IsDeleted)
                .FirstOrDefaultAsync();

            if (updatedSlider is null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View(updatedSlider);
            }

            if (slider.File is not null)
            {
                if (!Helper.isImage(slider.File))
                {
                    ModelState.AddModelError("file", "File must be an image");
                    return View(updatedSlider);
                }
                if (!Helper.isSizeOk(slider.File, 1))
                {
                    ModelState.AddModelError("file", "Size of the image must be less than 1 MB");
                    return View(updatedSlider);
                }
                Helper.RemoveImage(_environment.WebRootPath, "Images/home-page/images/", updatedSlider.Image);
                slider.Image = slider.File.CreateImage(_environment.WebRootPath, "Images/home-page/images/");
            }
            else
            {
                slider.Image = updatedSlider.Image;
            }

            updatedSlider.Title = slider.Title;
            updatedSlider.Country = slider.Country;
            updatedSlider.Year = slider.Year;
            updatedSlider.Writer = slider.Writer;
            updatedSlider.Writer = slider.Writer;
            updatedSlider.MovieGenre = slider.MovieGenre;
            updatedSlider.UpdatedAt = DateTime.UtcNow;

            _context.Sliders.Update(updatedSlider);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Remove(int id)
        {
            Slider? slider = await _context.Sliders.Where(x => x.Id == id && !x.IsDeleted)
                .FirstOrDefaultAsync();
            if (slider is null)
            {
                return NotFound();
            }
            slider.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
    }
}