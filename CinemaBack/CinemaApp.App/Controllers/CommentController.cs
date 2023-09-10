using CinemaApp.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Controllers
{
    [Authorize(Roles ="User")]
    public class CommentController : Controller
    {
        public async Task<IActionResult> Index(Comment comment)
        {
            comment.AppUser
            return Redirect(Request.Headers["Referer"].ToString());
        }
    }
}
