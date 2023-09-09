using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Win32;
using MimeKit;
using MimeKit.Cryptography;
using System.Net;
using System.Net.Mail;

namespace CinemaApp.App.Controllers
{
    public class AccountController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IWebHostEnvironment _environment;
        public AccountController(RoleManager<IdentityRole> roleManager, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, IWebHostEnvironment environment)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _signInManager = signInManager;
            _environment = environment;
        }
        [HttpGet]
        public async Task<IActionResult> Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel registerView)
        {
            if (!ModelState.IsValid)
            {
                return View(registerView);
            }

            AppUser appUser = new AppUser
            {
                Name = registerView.Name,
                SurName = registerView.Surname,
                UserName = registerView.UserName,
                Email = registerView.Email
            };

           IdentityResult identityResult= await _userManager.CreateAsync(appUser, registerView.Password);
            if (!identityResult.Succeeded)
            {
                foreach(var item in identityResult.Errors)
                {
                    ModelState.AddModelError("",item.Description);
                }
                return View(registerView);
            }
            await _userManager.AddToRoleAsync(appUser, "User");

             string token = await _userManager.GenerateEmailConfirmationTokenAsync(appUser);
           
            var link = Url.Action(action: "VerifyEmail", controller: "account", values: new { token = token, email = appUser.Email }, protocol: Request.Scheme);

            string path = Path.Combine(_environment.WebRootPath, "Templates", "confirm-email.html");
            string body = string.Empty;

            using (StreamReader SourceReader = System.IO.File.OpenText(path))
            {
                body = SourceReader.ReadToEnd();
            }

            body = body.Replace("{LinkPlaceholder}", link);
            body = body.Replace("{TextPlaceholder}", "Click here to verify your email");
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("sineraytd@code.edu.az");
            mail.To.Add(appUser.Email);
            mail.Subject = "VerifyEmail";
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("sineraytd@code.edu.az", "npskcupnxcgwvvwi");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(mail);
           
            return RedirectToAction("index" ,"home");
        }

        public async Task<IActionResult> VerifyEmail(string token, string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user is null)
            {
                return NotFound();
            }
            await _userManager.ConfirmEmailAsync(user, token);
            await _signInManager.SignInAsync(user, true);
            return RedirectToAction("index", "home");
        }

        [HttpGet]
        public async Task<IActionResult> Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login( LoginViewModel login)
        {

            if (!ModelState.IsValid)
            {
                return View(login);
            }

            AppUser appUser = await _userManager.FindByNameAsync(login.UserName);
            
            if(appUser == null)
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
        
        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("index", "home");
        }

        [Authorize]
        public async Task<IActionResult> Info()
        {
            string username = User.Identity.Name;
            AppUser appUser = await _userManager.FindByNameAsync(username);
            if (!await _userManager.IsInRoleAsync(appUser, "User"))
            {
                TempData["AdminInfo"] = "You cannot see Admin Info";
                return RedirectToAction("index", "home");
            }
            return View(appUser);
        }

        [HttpGet]
        [Authorize]
        public async Task<IActionResult> Update()
        {
            var user = await _userManager.FindByNameAsync(User.Identity.Name);
            if (user is null)
            {
                return NotFound();
            }
            UserUpdateViewModel userUpdateView = new UserUpdateViewModel()
            {
                UserName = user.UserName,
                Email = user.Email,
                Name = user.Name,
                Surname = user.SurName,
            };
            return View(userUpdateView);
        }
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Update(UserUpdateViewModel model)
        {
            var user = await _userManager.FindByNameAsync(User.Identity.Name);

            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (user is null)
            {
                return NotFound();
            }

            user.Name = model.Name;
            user.Email = model.Email;
            user.SurName = model.Surname;
            user.UserName = model.UserName;

            var result = await _userManager.UpdateAsync(user);

            if (!result.Succeeded)
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View(model);
            }

            if (!string.IsNullOrWhiteSpace(model.NewPassword))
            {
                result = await _userManager.ChangePasswordAsync(user, model.CurrentPassword, model.NewPassword);

                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                    return View(model);
                }
            }
            await _signInManager.SignInAsync(user, true);
            TempData["updateduser"] = "ok";
            return RedirectToAction(nameof(Info));
        }
        [HttpGet]
        public async Task<IActionResult> ForgetPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgetPassword(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return NotFound();
            }

            string token = await _userManager.GeneratePasswordResetTokenAsync(user);
            
            var link = Url.Action(action: "resetpassword", controller: "account", values: new { token = token, email = email }, protocol: Request.Scheme);

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("sineraytd@code.edu.az");
            mail.To.Add(user.Email);
            mail.Subject = "Reset Password";
            mail.Body = $"<a href='{link}'>Click here to reset your password</a>";
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("sineraytd@code.edu.az", "npskcupnxcgwvvwi");
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(mail);

            return RedirectToAction("index","home");
        }


        [HttpGet]
        public async Task<IActionResult> ResetPassword(string email, string token)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user is null)
            {
                return NotFound();
            }
            ResetPasswordViewModel resetPasswordView = new ResetPasswordViewModel()
            {
                Email= email,
                Token = token
            };
            return View(resetPasswordView);
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(ResetPasswordViewModel resetPassword)
        {
            if (!ModelState.IsValid)
            {
                return View(resetPassword);
            }
            var user = await _userManager.FindByEmailAsync(resetPassword.Email);
            if (user is null)
            {
                return NotFound();
            }
            var result = await _userManager.
                ResetPasswordAsync(user, resetPassword.Token, resetPassword.Password);
            if (!result.Succeeded)
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View(resetPassword);
            }
            return RedirectToAction("login", "account");
        }
    }
}
