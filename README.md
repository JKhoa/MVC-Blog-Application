# Ứng Dụng MVC Blog - Lab 3

## 🎯 Tổng Quan
Ứng dụng Blog ASP.NET MVC 5 được xây dựng cho môn Web Nâng Cao (Lab 3). Bao gồm đầy đủ các chức năng CRUD cho quản lý Blog và Post với tích hợp Entity Framework.

## 🌐 Demo Trực Tuyến
**🚀 [Xem Demo Trực Tuyến](https://jkhoa.github.io/MVC-Blog-Application/)**

## 🏗️ Kiến Trúc
- **Framework**: ASP.NET MVC 5.2.9
- **ORM**: Entity Framework 6.4.4
- **Cơ sở dữ liệu**: SQL Server LocalDB
- **Frontend**: Razor Views + Bootstrap 5
- **Mô hình**: Kiến trúc MVC với Repository Pattern

## 📁 Cấu Trúc Project
```
MvcBlog/
├── Controllers/          # MVC Controllers (Blog, Post, Home)
├── Views/               # Razor Views with Layouts
├── App_Start/           # Cấu hình (Routes, Filters)
├── Content/             # CSS và Static Assets
├── Models/              # View Models
├── References/          # EntityModel & EntityController
└── docs/                # Trang Demo cho GitHub Pages
```

## 🔗 Mẫu URL
| Hành Động | URL | Mô Tả |
|-----------|-----|-------|
| Tất cả Blogs | `/Blog` hoặc `/Blog/Index` | Danh sách tất cả blogs và posts |
| Chi tiết Blog | `/Blog/Get/{id}` | Xem blog cụ thể theo ID |
| Tất cả Posts | `/Post` hoặc `/Post/Index` | Danh sách tất cả posts |
| Chi tiết Post | `/Post/Get/{id}` | Xem post cụ thể theo ID |
| Tìm kiếm | `/Blog/Search?keyword=...` | Tìm kiếm blogs |
| Tags | `/Post/Tags` | Xem tất cả tags |

## 🚀 Hướng Dẫn Sử Dụng

### Tùy chọn 1: Xem Demo Trực Tuyến
1. Truy cập: [https://jkhoa.github.io/MVC-Blog-Application/](https://jkhoa.github.io/MVC-Blog-Application/)
2. Nhấn nút "Live Demo"

### Tùy chọn 2: Chạy Trên Máy Local
1. **Yêu cầu**: Visual Studio với ASP.NET development workload
2. **Clone**: `git clone https://github.com/JKhoa/MVC-Blog-Application.git`
3. **Mở**: `MvcBlog.csproj` trong Visual Studio
4. **Build**: Ctrl + Shift + B
5. **Chạy**: F5 (sẽ tự động tạo database)

### Tùy chọn 3: PowerShell Scripts
```powershell
# Demo nhanh
.\quick-demo.ps1

# Deploy lên các platform
.\deploy-azure.ps1     # Azure App Service
.\deploy-netlify.ps1   # Netlify
```

## 🗄️ Schema Database
- **Blog**: BlogId, Title, Description, Author, CreateDate, IsActive
- **Post**: PostId, BlogId (FK), Title, Summary, Content, Tags, Author, CreateDate, IsPublished

## 🎨 Tính Năng
- ✅ Đầy đủ các thao tác CRUD cho Blogs và Posts
- ✅ Khả năng tìm kiếm và lọc
- ✅ Tổ chức posts theo tags
- ✅ Thiết kế responsive với Bootstrap
- ✅ Phương pháp Entity Framework Code-First
- ✅ Kiến trúc MVC sạch sẽ
- ✅ UI/UX chuyên nghiệp

## 📦 Dependencies
- Microsoft.AspNet.Mvc (5.2.9)
- EntityFramework (6.4.4)
- Bootstrap (5.3.0)
- Font Awesome (6.0.0)

## 🔧 Cấu Hình
- **Connection String**: Tự động tạo `TDADatabase` trong LocalDB
- **Routing**: Mẫu mặc định `{controller}/{action}/{id}`
- **Entity Framework**: Code-First với automatic migrations

## 📝 Ghi Chú Phát Triển
- Được xây dựng với Visual Studio (cần .NET Framework)
- Không thể chạy bằng `dotnet CLI` (giới hạn của ASP.NET MVC 5)
- Tích hợp với Lab 2 EntityModel và EntityController
- Được documented đầy đủ với comprehensive views

## � Giấy Phép
Dự án giáo dục cho mục đích học thuật.

---

🌟 **[Xem Demo Trực Tuyến](https://jkhoa.github.io/MVC-Blog-Application/)** | 📁 **[Mã Nguồn](https://github.com/JKhoa/MVC-Blog-Application)**
