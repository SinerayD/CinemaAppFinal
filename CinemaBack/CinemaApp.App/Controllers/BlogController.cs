using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Controllers
{
    public class BlogController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public BlogController(CinemaAppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index(int? id)
        {
            ViewBag.Categories = await _context.Categories.Where(x => !x.IsDeleted)
              .Include(x => x.blogCategories)
               .ThenInclude(x => x.Blog)
                 .ToListAsync();

            ViewBag.Tags = await _context.Tags.Where(x => !x.IsDeleted)
           .Include(x => x.blogTags)
           .ThenInclude(x => x.Blog)
           .ToListAsync();

            if (id == null)
            {
                IEnumerable<Blog>? blogs = await _context.Blogs.Where(x => !x.IsDeleted)
                      .Include(x => x.BlogCategories)
                     .ThenInclude(x => x.Category)
                .Include(x => x.BlogTags)
                     .ThenInclude(x => x.Tag)
                    .ToListAsync();

                return View(blogs);
            }
            else
            {
                IEnumerable<Blog>? blogs = await _context.Blogs.Where(x => !x.IsDeleted && x.BlogCategories.Any(x => x.Category.Id == id))
                    .Include(x => x.BlogCategories)
                       .ThenInclude(x => x.Category)
                    .Include(x => x.BlogTags)
                       .ThenInclude(x => x.Tag)
                    .ToListAsync();
                return View(blogs);
            }
        }
        public async Task<IActionResult> Detail(int id)
        {
            ViewBag.Categories = await _context.Categories.Where(x => !x.IsDeleted)
                .Include(x => x.blogCategories)
                .ThenInclude(x => x.Blog)
                .ToListAsync();

            ViewBag.Tags = await _context.Tags.Where(x => !x.IsDeleted)
                .Include(x => x.blogTags)
                .ThenInclude(x => x.Blog)
                .ToListAsync();

            ViewBag.Blogs = await _context.Blogs.Where(x => !x.IsDeleted)
                      .Include(x => x.BlogCategories)
                     .ThenInclude(x => x.Category)
                           .Include(x => x.BlogTags)
                     .ThenInclude(x => x.Tag)
                     .Take(3)
                    .ToListAsync();

            Blog? blog = await _context.Blogs
                .Where(x => x.Id == id && !x.IsDeleted)
                .Include(x => x.BlogCategories)
                .ThenInclude(x => x.Category)
                .Include(x => x.BlogTags)
                .ThenInclude(x => x.Tag)
                .FirstOrDefaultAsync();

            BlogVm blogVm = new BlogVm
            {
                blog = blog
            };

            return View(blogVm);
        }

        public IActionResult Search(string search)
        {
            List<Blog> searchName = _context.Blogs.Where(s => !s.IsDeleted && s.Title.Trim().Contains(search.Trim())|| s.Description.Trim().Contains(search.Trim())).ToList();
            return PartialView("_Search", searchName);
        }


    }

}