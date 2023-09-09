using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;


namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpGet]
        public async Task<IActionResult> Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel login)
        {
            if (!ModelState.IsValid)
            {
                return View(login);
            }

            AppUser appUser = await _userManager.FindByNameAsync(login.UserName);

            if (appUser == null)
            {
                ModelState.AddModelError("", "Username or password is incorrect");
                return View();
            }

            var result = await _signInManager.PasswordSignInAsync(appUser, login.Password, login.IsRememberMe, true);

            if (!result.Succeeded)
            {
                if (result.IsLockedOut)
                {
                    ModelState.AddModelError("", "Your account is blocked for 5 minutes.");
                    return View(login);
                }

                ModelState.AddModelError("", "Username or password is incorrect.");
                return View(login);
            }

            return RedirectToAction("index", "home");
        }

        [Authorize("Admin, SuperAdmin")]
        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("index", "home");
        }
    }
}
