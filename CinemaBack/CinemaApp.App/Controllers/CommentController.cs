using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    [Authorize(Roles ="User")]
    public class CommentController : Controller
    {
        private readonly CinemaAppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public CommentController(CinemaAppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> AddComment(Comment comment)
        {
            AppUser appUser = await _userManager.FindByNameAsync(User.Identity.Name);
            
            await _context.Comments.AddAsync(comment);
            comment.AppUserId=appUser.Id;
            await _context.SaveChangesAsync();  
            return Redirect(Request.Headers["Referer"].ToString());
        }
    }
}
