using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "SuperAdmin,Admin")]
    public class TagController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public TagController(CinemaAppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Tag> tags = await _context.Tags.Where(x => !x.IsDeleted).ToListAsync();
            return View(tags);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Tag tag)
        {
            if (!ModelState.IsValid)
            {
                return View(tag);
            }
            await _context.AddAsync(tag);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            Tag? tag = await _context.Tags
                .Where(x => !x.IsDeleted && x.Id == id)
                .FirstOrDefaultAsync();

            if (tag == null)
                return NotFound();

            return View(tag);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Tag postTag)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            Tag? tag = await _context.Tags.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();

            if (tag == null)
                return NotFound();

            tag.Name = postTag.Name;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Remove(int id)
        {
            Tag? tag = await _context.Tags.Where(x => !x.IsDeleted && x.Id == id).FirstOrDefaultAsync();

            if (tag == null)
                return NotFound();

            tag.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
    }
}
