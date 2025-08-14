using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityModel;
using EntityController;

namespace MvcBlog.Controllers
{
    public class BlogController : Controller
    {
        private BlogController blogController;
        private PostController postController;

        public BlogController()
        {
            blogController = new EntityController.BlogController();
            postController = new EntityController.PostController();
        }

        /// <summary>
        /// GET: /Blog/Get/{BlogID}
        /// Lấy nội dung 1 Blog từ database với BlogID
        /// Ví dụ: http://localhost:xxxx/Blog/Get/1
        /// </summary>
        /// <param name="id">BlogID</param>
        /// <returns>View hiển thị thông tin blog</returns>
        public ActionResult Get(int? id)
        {
            try
            {
                if (id == null)
                {
                    ViewBag.Error = "BlogID không được để trống";
                    return View("Error");
                }

                // Lấy blog với posts kèm theo
                var blog = blogController.GetBlogWithPosts(id.Value);
                
                if (blog == null)
                {
                    ViewBag.Error = $"Không tìm thấy Blog với ID: {id}";
                    return View("Error");
                }

                ViewBag.Title = $"Blog: {blog.Title}";
                return View(blog);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy thông tin blog: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Blog hoặc /Blog/Index
        /// Hiển thị nội dung toàn bộ bảng Blog, với mỗi Blog hiển thị các Post con kèm theo
        /// Ví dụ: http://localhost/Blog
        /// </summary>
        /// <returns>View hiển thị danh sách tất cả blogs</returns>
        public ActionResult Index()
        {
            try
            {
                // Lấy tất cả blogs với posts kèm theo
                var blogs = blogController.GetAllBlogsWithPosts();
                
                ViewBag.Title = "Danh sách tất cả Blogs";
                ViewBag.TotalBlogs = blogs.Count;
                
                return View(blogs);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách blogs: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Blog/ActiveBlogs
        /// Hiển thị chỉ những blog đang hoạt động
        /// </summary>
        /// <returns>View hiển thị danh sách blogs hoạt động</returns>
        public ActionResult ActiveBlogs()
        {
            try
            {
                var activeBlogs = blogController.GetActiveBlogs();
                ViewBag.Title = "Danh sách Blogs đang hoạt động";
                ViewBag.TotalActiveBlogs = activeBlogs.Count;
                
                return View("Index", activeBlogs);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách blogs hoạt động: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Blog/Recent
        /// Hiển thị các blog gần đây
        /// </summary>
        /// <param name="count">Số lượng blog gần đây cần lấy</param>
        /// <returns>View hiển thị blogs gần đây</returns>
        public ActionResult Recent(int count = 5)
        {
            try
            {
                var recentBlogs = blogController.GetRecentBlogs(count);
                ViewBag.Title = $"{count} Blogs gần đây";
                ViewBag.Count = count;
                
                return View("Index", recentBlogs);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy blogs gần đây: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Blog/Search
        /// Tìm kiếm blogs theo từ khóa
        /// </summary>
        /// <param name="keyword">Từ khóa tìm kiếm</param>
        /// <returns>View hiển thị kết quả tìm kiếm</returns>
        public ActionResult Search(string keyword)
        {
            try
            {
                if (string.IsNullOrEmpty(keyword))
                {
                    ViewBag.Message = "Vui lòng nhập từ khóa tìm kiếm";
                    return View("Index", new List<Blog>());
                }

                var searchResults = blogController.SearchBlogs(keyword);
                ViewBag.Title = $"Kết quả tìm kiếm cho: '{keyword}'";
                ViewBag.Keyword = keyword;
                ViewBag.ResultCount = searchResults.Count;
                
                return View("Index", searchResults);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi tìm kiếm blogs: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Blog/Statistics/{id}
        /// Hiển thị thống kê cho một blog
        /// </summary>
        /// <param name="id">Blog ID</param>
        /// <returns>View hiển thị thống kê blog</returns>
        public ActionResult Statistics(int? id)
        {
            try
            {
                if (id == null)
                {
                    ViewBag.Error = "BlogID không được để trống";
                    return View("Error");
                }

                var statistics = blogController.GetBlogStatistics(id.Value);
                if (statistics == null)
                {
                    ViewBag.Error = $"Không tìm thấy Blog với ID: {id}";
                    return View("Error");
                }

                ViewBag.Title = $"Thống kê Blog ID: {id}";
                return View(statistics);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy thống kê blog: {ex.Message}";
                return View("Error");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                blogController?.Dispose();
                postController?.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
