using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityModel;
using EntityController;

namespace MvcBlog.Controllers
{
    public class PostController : Controller
    {
        private PostController postController;
        private BlogController blogController;

        public PostController()
        {
            postController = new EntityController.PostController();
            blogController = new EntityController.BlogController();
        }

        /// <summary>
        /// GET: /Post/Get/{PostID}
        /// Lấy nội dung 1 Post từ database với PostID
        /// Ví dụ: http://localhost:xxxx/Post/Get/1
        /// </summary>
        /// <param name="id">PostID</param>
        /// <returns>View hiển thị thông tin post</returns>
        public ActionResult Get(int? id)
        {
            try
            {
                if (id == null)
                {
                    ViewBag.Error = "PostID không được để trống";
                    return View("Error");
                }

                // Lấy post với blog kèm theo
                var post = postController.GetPostWithBlog(id.Value);
                
                if (post == null)
                {
                    ViewBag.Error = $"Không tìm thấy Post với ID: {id}";
                    return View("Error");
                }

                ViewBag.Title = $"Post: {post.Title}";
                return View(post);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy thông tin post: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post hoặc /Post/Index
        /// Hiển thị nội dung toàn bộ bảng Post
        /// Ví dụ: http://localhost/Post
        /// </summary>
        /// <returns>View hiển thị danh sách tất cả posts</returns>
        public ActionResult Index()
        {
            try
            {
                // Lấy tất cả posts với blog kèm theo
                var posts = postController.GetAllPostsWithBlogs();
                
                ViewBag.Title = "Danh sách tất cả Posts";
                ViewBag.TotalPosts = posts.Count;
                
                return View(posts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách posts: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/Published
        /// Hiển thị chỉ những post đã được publish
        /// </summary>
        /// <returns>View hiển thị danh sách posts đã publish</returns>
        public ActionResult Published()
        {
            try
            {
                var publishedPosts = postController.GetPublishedPosts();
                ViewBag.Title = "Danh sách Posts đã xuất bản";
                ViewBag.TotalPublishedPosts = publishedPosts.Count;
                
                return View("Index", publishedPosts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách posts đã xuất bản: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/Draft
        /// Hiển thị chỉ những post còn ở trạng thái draft
        /// </summary>
        /// <returns>View hiển thị danh sách posts draft</returns>
        public ActionResult Draft()
        {
            try
            {
                var draftPosts = postController.GetDraftPosts();
                ViewBag.Title = "Danh sách Posts nháp";
                ViewBag.TotalDraftPosts = draftPosts.Count;
                
                return View("Index", draftPosts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách posts nháp: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/ByBlog/{blogId}
        /// Hiển thị tất cả posts của một blog cụ thể
        /// </summary>
        /// <param name="blogId">Blog ID</param>
        /// <returns>View hiển thị posts của blog</returns>
        public ActionResult ByBlog(int? blogId)
        {
            try
            {
                if (blogId == null)
                {
                    ViewBag.Error = "BlogID không được để trống";
                    return View("Error");
                }

                var posts = postController.GetPostsByBlogId(blogId.Value);
                var blog = blogController.GetById(blogId.Value);
                
                ViewBag.Title = blog != null ? $"Posts trong Blog: {blog.Title}" : $"Posts trong Blog ID: {blogId}";
                ViewBag.BlogTitle = blog?.Title;
                ViewBag.BlogId = blogId;
                ViewBag.TotalPosts = posts.Count;
                
                return View("Index", posts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy posts theo blog: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/Recent
        /// Hiển thị các post gần đây
        /// </summary>
        /// <param name="count">Số lượng post gần đây cần lấy</param>
        /// <param name="publishedOnly">Chỉ lấy posts đã publish</param>
        /// <returns>View hiển thị posts gần đây</returns>
        public ActionResult Recent(int count = 10, bool publishedOnly = true)
        {
            try
            {
                var recentPosts = postController.GetRecentPosts(count, publishedOnly);
                ViewBag.Title = $"{count} Posts gần đây" + (publishedOnly ? " (đã xuất bản)" : "");
                ViewBag.Count = count;
                ViewBag.PublishedOnly = publishedOnly;
                
                return View("Index", recentPosts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy posts gần đây: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/Search
        /// Tìm kiếm posts theo từ khóa
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
                    return View("Index", new List<Post>());
                }

                var searchResults = postController.SearchPosts(keyword);
                ViewBag.Title = $"Kết quả tìm kiếm posts cho: '{keyword}'";
                ViewBag.Keyword = keyword;
                ViewBag.ResultCount = searchResults.Count;
                
                return View("Index", searchResults);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi tìm kiếm posts: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/ByTag
        /// Hiển thị posts theo tag
        /// </summary>
        /// <param name="tag">Tag name</param>
        /// <returns>View hiển thị posts theo tag</returns>
        public ActionResult ByTag(string tag)
        {
            try
            {
                if (string.IsNullOrEmpty(tag))
                {
                    ViewBag.Error = "Tag không được để trống";
                    return View("Error");
                }

                var posts = postController.GetPostsByTag(tag);
                ViewBag.Title = $"Posts với tag: '{tag}'";
                ViewBag.Tag = tag;
                ViewBag.TotalPosts = posts.Count;
                
                return View("Index", posts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy posts theo tag: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/Tags
        /// Hiển thị tất cả tags có sẵn
        /// </summary>
        /// <returns>View hiển thị danh sách tags</returns>
        public ActionResult Tags()
        {
            try
            {
                var allTags = postController.GetAllTags();
                ViewBag.Title = "Tất cả Tags";
                ViewBag.TotalTags = allTags.Count;
                
                return View(allTags);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy danh sách tags: {ex.Message}";
                return View("Error");
            }
        }

        /// <summary>
        /// GET: /Post/ByAuthor
        /// Hiển thị posts theo tác giả
        /// </summary>
        /// <param name="author">Tên tác giả</param>
        /// <returns>View hiển thị posts của tác giả</returns>
        public ActionResult ByAuthor(string author)
        {
            try
            {
                if (string.IsNullOrEmpty(author))
                {
                    ViewBag.Error = "Tên tác giả không được để trống";
                    return View("Error");
                }

                var posts = postController.GetPostsByAuthor(author);
                ViewBag.Title = $"Posts của tác giả: '{author}'";
                ViewBag.Author = author;
                ViewBag.TotalPosts = posts.Count;
                
                return View("Index", posts);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Lỗi khi lấy posts theo tác giả: {ex.Message}";
                return View("Error");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                postController?.Dispose();
                blogController?.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
