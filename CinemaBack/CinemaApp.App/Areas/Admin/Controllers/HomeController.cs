﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CinemaApp.App.Areas.Admin.Controllers
{
    [Area("Admin") ]
    [Authorize(Roles = "SuperAdmin,Admin")]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
