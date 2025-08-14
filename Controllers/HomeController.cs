using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBlog.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.Title = "MvcBlog - Trang chủ";
            ViewBag.Message = "Chào mừng đến với MvcBlog - Lab 3";
            return View();
        }
    }
}
