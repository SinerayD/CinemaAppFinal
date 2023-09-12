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
    public class BlogController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public BlogController(CinemaAppDbContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            IEnumerable<Blog> blogs = await _context.Blogs
                .Where(x => !x.IsDeleted)
                .Include(b =>b.BlogCategories )
                    .ThenInclude(bc => bc.Category)
                .ToListAsync();
          
              return View(blogs);

        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            ViewBag.Categories = await _context.Categories
               .Where(x => !x.IsDeleted)
               .ToListAsync();

            ViewBag.Tags = await _context.Tags
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Blog blog)
        {
            ViewBag.Categories = await _context.Categories.Where(x => !x.IsDeleted).ToListAsync();
            ViewBag.Tags = await _context.Tags.Where(x => !x.IsDeleted).ToListAsync();

            if (!ModelState.IsValid)
            {
                return View(blog);
            }
            if (blog.File is null)
            {
                ModelState.AddModelError("file", "Image must be added");
                return View(blog);
            }
            if (!Helper.isImage(blog.File))
            {
                ModelState.AddModelError("file", "File must be image");
                return View(blog);
            }
            if (!Helper.isSizeOk(blog.File, 1))
            {
                ModelState.AddModelError("file", "Size of Image must less than 1 mb!!!");
                return View(blog);
            }
            foreach (var categoryId in blog.CategoryIds)
            {
                if (!await _context.Categories.AnyAsync(x => x.Id == categoryId))
                {
                    ModelState.AddModelError("", "Invalid Category Id");
                    return View(blog);
                }

                BlogCategory blogCategory = new BlogCategory
                {
                    CreatedAt = DateTime.Now,
                    Blog=blog,
                    CategoryId = categoryId,
                };
                await _context.BlogCategories.AddAsync(blogCategory);
            }

            foreach (var tagId in blog.TagIds)
            {
                if (!await _context.Tags.AnyAsync(x => x.Id == tagId))
                {
                    ModelState.AddModelError("", "Invalid Tag Id");
                    return View(blog);
                }

                BlogTag blogTag = new BlogTag
                {
                    CreatedAt = DateTime.Now,
                    TagId = tagId,
                    Blog=blog
                };
                await _context.BlogTags.AddAsync(blogTag);
            }


            blog.Image = blog.File.CreateImage(_environment.WebRootPath, "Images/blog-page/images/");
            blog.CreatedAt = DateTime.Now;
            await _context.AddAsync(blog);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public async Task<IActionResult> Update(int id)
        {
            ViewBag.Categories = await _context.Categories.Where(p => !p.IsDeleted).ToListAsync();
            ViewBag.Tags = await _context.Tags.Where(p => !p.IsDeleted).ToListAsync();
            Blog? blog = await _context.Blogs.Where(x => x.Id == id && !x.IsDeleted)
                .AsNoTracking()
                .Include(x => x.BlogCategories)
                   .ThenInclude(x => x.Category)
                 .Include(x => x.BlogTags)
                    .ThenInclude(x => x.Tag)
             .FirstOrDefaultAsync();
            if (blog is null)
            {
                return NotFound();
            }
            return View(blog);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int id, Blog blog)
        {
            ViewBag.Categories = await _context.Categories.Where(p => !p.IsDeleted).ToListAsync();
            ViewBag.Tags = await _context.Tags.Where(p => !p.IsDeleted).ToListAsync();
            Blog? updatedBlog = await _context.Blogs.Where(x => x.Id == id && !x.IsDeleted)
                .AsNoTracking()
                .Include(x => x.BlogCategories)
                   .ThenInclude(x => x.Category)
                 .Include(x => x.BlogTags)
                    .ThenInclude(x => x.Tag)
             .FirstOrDefaultAsync();
            if (blog is null)
            {
                return View(blog);
            }
            if (!ModelState.IsValid)
            {
                return View(updatedBlog);
            }

            if (blog.File is not null)
            {
                if (!Helper.isImage(blog.File))
                {
                    ModelState.AddModelError("file", "File must be image");
                    return View(blog);
                }
                if (!Helper.isSizeOk(blog.File, 1))
                {
                    ModelState.AddModelError("file", "Size of Image must less than 1 mb!!!");
                    return View(blog);
                }
                Helper.RemoveImage(_environment.WebRootPath, "Images/blog-page/images/", updatedBlog.Image);
                blog.Image = blog.File.CreateImage(_environment.WebRootPath, "Images/blog-page/images/");
            }
            else
            {
                blog.Image = updatedBlog.Image;
            }
            List<BlogCategory> RemoveableCategory = await _context.BlogCategories.
               Where(x => !blog.CategoryIds.Contains(x.CategoryId) && x.BlogId == blog.Id).ToListAsync();

            _context.BlogCategories.RemoveRange(RemoveableCategory);
            foreach (var item in blog.CategoryIds)
            {
                if (_context.BlogCategories.Where(x => x.BlogId == id && x.CategoryId == item).Count() > 0)
                    continue;

                await _context.BlogCategories.AddAsync(new BlogCategory
                {
                    BlogId = id,
                    CategoryId = item
                });
            }
            List<BlogTag> RemoveableTag = await _context.BlogTags.
            Where(x => !blog.TagIds.Contains(x.TagId) && x.BlogId == blog.Id).ToListAsync();

            _context.BlogTags.RemoveRange(RemoveableTag);
            foreach (var item in blog.TagIds)
            {
                if (_context.BlogTags.Where(x => x.BlogId == id && x.TagId == item).Count() > 0)
                    continue;

                await _context.BlogTags.AddAsync(new BlogTag
                {
                    BlogId = id,
                    TagId = item
                });
            }
            blog.CreatedAt = updatedBlog.CreatedAt;
            blog.UpdatedAt = DateTime.Now;
            _context.Blogs.Update(blog);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Remove(int id)
        {
            Blog? blog = await _context.Blogs.Where(x => x.Id == id && !x.IsDeleted)
                .FirstOrDefaultAsync();
            if (blog is null)
            {
                return NotFound();
            }
            blog.IsDeleted = true;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
    }
}

