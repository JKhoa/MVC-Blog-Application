# MVC Blog Application - Lab 3

## 🎯 Overview
ASP.NET MVC 5 Blog Application built for Web Development Advanced Course (Lab 3). Features full CRUD operations for Blog and Post management with Entity Framework integration.

## 🌐 Live Demo
**🚀 [View Live Demo](https://jkhoa.github.io/MVC-Blog-Application/)**

## 🏗️ Architecture
- **Framework**: ASP.NET MVC 5.2.9
- **ORM**: Entity Framework 6.4.4
- **Database**: SQL Server LocalDB
- **Frontend**: Razor Views + Bootstrap 5
- **Pattern**: MVC Architecture with Repository Pattern

## 📁 Project Structure
```
MvcBlog/
├── Controllers/          # MVC Controllers (Blog, Post, Home)
├── Views/               # Razor Views with Layouts
├── App_Start/           # Configuration (Routes, Filters)
├── Content/             # CSS and Static Assets
├── Models/              # View Models
├── References/          # EntityModel & EntityController
└── docs/                # Demo Page for GitHub Pages
```

## ✅ Lab Requirements Completed
- **Câu c**: ✅ Created BlogController and PostController
- **Câu d**: ✅ BlogController with Get(int BlogID) and Index() methods
- **Câu e**: ✅ PostController with Get(int PostID) and Index() methods
- **RouteConfig**: ✅ Configured {controller}/{action}/{id} routing pattern

## 🔗 URL Patterns
| Action | URL | Description |
|--------|-----|-------------|
| All Blogs | `/Blog` or `/Blog/Index` | List all blogs with posts |
| Blog Details | `/Blog/Get/{id}` | View specific blog by ID |
| All Posts | `/Post` or `/Post/Index` | List all posts |
| Post Details | `/Post/Get/{id}` | View specific post by ID |
| Search | `/Blog/Search?keyword=...` | Search blogs |
| Tags | `/Post/Tags` | View all tags |

## 🚀 Quick Start

### Option 1: View Online Demo
1. Visit: [https://jkhoa.github.io/MVC-Blog-Application/](https://jkhoa.github.io/MVC-Blog-Application/)
2. Click "Live Demo" button

### Option 2: Run Locally
1. **Prerequisites**: Visual Studio with ASP.NET development workload
2. **Clone**: `git clone https://github.com/JKhoa/MVC-Blog-Application.git`
3. **Open**: `MvcBlog.csproj` in Visual Studio
4. **Build**: Ctrl + Shift + B
5. **Run**: F5 (will auto-create database)

### Option 3: PowerShell Scripts
```powershell
# Quick demo
.\quick-demo.ps1

# Deploy to various platforms
.\deploy-azure.ps1     # Azure App Service
.\deploy-netlify.ps1   # Netlify
```

## 🗄️ Database Schema
- **Blog**: BlogId, Title, Description, Author, CreateDate, IsActive
- **Post**: PostId, BlogId (FK), Title, Summary, Content, Tags, Author, CreateDate, IsPublished

## 🎨 Features
- ✅ Full CRUD operations for Blogs and Posts
- ✅ Search and filtering capabilities
- ✅ Tag-based post organization
- ✅ Responsive design with Bootstrap
- ✅ Entity Framework Code-First approach
- ✅ Clean MVC architecture
- ✅ Professional UI/UX

## 📦 Dependencies
- Microsoft.AspNet.Mvc (5.2.9)
- EntityFramework (6.4.4)
- Bootstrap (5.3.0)
- Font Awesome (6.0.0)

## 🔧 Configuration
- **Connection String**: Auto-creates `TDADatabase` in LocalDB
- **Routing**: Default pattern `{controller}/{action}/{id}`
- **Entity Framework**: Code-First with automatic migrations

## 📝 Development Notes
- Built with Visual Studio (requires .NET Framework)
- Cannot run with `dotnet CLI` (ASP.NET MVC 5 limitation)
- Integrated with Lab 2 EntityModel and EntityController
- Fully documented with comprehensive views

## 👨‍💻 Author
**Lab 3 - Web Development Advanced Course**  
**Institution**: [Your Institution]  
**Year**: 2025

## 📄 License
Educational project for academic purposes.

---

🌟 **[View Live Demo](https://jkhoa.github.io/MVC-Blog-Application/)** | 📁 **[Source Code](https://github.com/JKhoa/MVC-Blog-Application)**
