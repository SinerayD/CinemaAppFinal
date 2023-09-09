using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Controllers
{
    public class ContactController : Controller
    {
        private readonly CinemaAppDbContext _context;

        public ContactController(CinemaAppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
           ContactMessage message = new ContactMessage();

            return View(message);
        }


        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<IActionResult> Index(ContactMessage message)
        {
            

                if (!ModelState.IsValid)
                {
                    return RedirectToAction(nameof(Index));
                }

            if (message.Name == null || message.Email == null || message.PhoneNumber == null || message.Subject == null || message.Comment == null)
            {
                bool isExist = await _context.ContactMessages.AnyAsync(m => m.Name.Trim() == message.Name.Trim() &&
                m.Email.Trim() == message.Email.Trim() &&
                m.PhoneNumber.Trim() == message.PhoneNumber.Trim() &&
                m.Subject.Trim() == message.Subject.Trim() &&
                m.Comment == message.Comment);
                if (isExist)
                {
                    ModelState.AddModelError("Name", "Subject already exist");
                    return View();
                }
            }


            

               
                await _context.ContactMessages.AddAsync(message);
                await _context.SaveChangesAsync();


                return RedirectToAction(nameof(Index));
         

        }
    }
}
