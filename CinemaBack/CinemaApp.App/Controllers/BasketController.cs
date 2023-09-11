using CinemaApp.App.Entities;
using CinemaApp.App.ViewModels;
using CinemaApp.Core.Entities;
using CinemaApp.Data.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CinemaApp.App.Controllers
{
    [Authorize]
    public class BasketController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly CinemaAppDbContext _context;

        public BasketController(UserManager<AppUser> userManager, CinemaAppDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            AppUser user = await _userManager.GetUserAsync(User);

            if (user == null) return Unauthorized();

            Basket basket = await _context.Baskets.Where(x => !x.IsDeleted).Include(x => x.BasketItems)
                .ThenInclude(x => x.Movie)
                .FirstOrDefaultAsync(x => x.AppUserId == user.Id);

            BasketIndexVM model = new BasketIndexVM();

            if (basket == null) return View(model);

            foreach (var item in basket.BasketItems)
            {
                BasketProductVM basketProduct = new BasketProductVM
                {
                    Id = item.Id,
                    Name = item.Movie.Name,
                    Image = item.Movie.Image,
                    Total = (item.Movie.Price * item.Quantity),
                    Price = item.Movie.Price,
                    Quantity = item.Quantity,
                };
                model.BasketProducts.Add(basketProduct);
            }

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AddBasket(BasketAddVM basketAddVM)
        {
            if (!ModelState.IsValid) return BadRequest(basketAddVM);

            AppUser user = await _userManager.GetUserAsync(User);
            if (user == null) return Unauthorized();

            Movie movie = await _context.Movies.FindAsync(basketAddVM.Id);

            if (movie == null) return NotFound();

            Basket basket = await _context.Baskets.FirstOrDefaultAsync(m => m.AppUserId == user.Id);

            if (basket == null)
            {
                basket = new Basket
                {
                    AppUserId = user.Id,

                };
                await _context.Baskets.AddAsync(basket);
                await _context.SaveChangesAsync();
            }

            BasketItem basketItem = await _context.BasketItems
                .FirstOrDefaultAsync(x => x.MovieId == movie.Id && x.BasketId == basket.Id);

            if (basketItem == null)
            {
                basketItem = new BasketItem
                {
                    MovieId = movie.Id,
                    BasketId = basket.Id,
                    Quantity = 1
                };
                await _context.BasketItems.AddAsync(basketItem);
            }
            else
            {
                basketItem.Quantity++;
            }

            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> PlusAdd(BasketAddVM basketAdd)
        {
            if (!ModelState.IsValid) return BadRequest(basketAdd);

            var basketProduct = await _context.BasketItems.Include(bp => bp.Movie)
                .FirstOrDefaultAsync(bp => bp.Id == basketAdd.Id);

            if (basketProduct == null) return NotFound();

            basketProduct.Quantity++;
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            if (!ModelState.IsValid) return BadRequest(id);

            AppUser user = await _userManager.GetUserAsync(User);
            if (user == null) return Unauthorized();

            Basket basket = await _context.Baskets.Include(x => x.BasketItems)
                .FirstOrDefaultAsync(x => x.AppUserId == user.Id);

            if (basket == null) return NotFound();

            BasketItem basketItem = await _context.BasketItems
                .FirstOrDefaultAsync(x => x.Id == id &&
                x.BasketId == basket.Id);

            if (basketItem == null) return NotFound();

            if (basketItem.Quantity > 1)
            {
                basketItem.Quantity--;
                await _context.SaveChangesAsync();

            }
            else
            {
                _context.BasketItems.Remove(basketItem);
                await _context.SaveChangesAsync();
            }

            return Ok();
        }


        [HttpPost]
        public async Task<IActionResult> DeleteAll(int id)
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null) return Unauthorized();

            var basketProduct = await _context.BasketItems
                .FirstOrDefaultAsync(bp => bp.Id == id
                && bp.Basket.AppUserId == user.Id);

            if (basketProduct == null) return NotFound();

            var product = await _context.Movies.FirstOrDefaultAsync(p => p.Id == basketProduct.MovieId);
            if (product == null) return NotFound();

            _context.BasketItems.Remove(basketProduct);
            await _context.SaveChangesAsync();
            return Ok();
        }


    }
}
