# Tạo link demo nhanh cho MVC Blog Lab 3
# Script này tạo demo page và hosting trên GitHub Pages

Write-Host "🚀 Tạo demo link cho MVC Blog Lab 3..." -ForegroundColor Green

# Tạo demo page với đầy đủ thông tin
$demoPage = @"
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demo: MVC Blog Lab 3 - ASP.NET MVC Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --card-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }
        body { 
            background: var(--primary-gradient); 
            min-height: 100vh; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .demo-container { 
            background: rgba(255,255,255,0.95); 
            border-radius: 20px; 
            box-shadow: var(--card-shadow);
            backdrop-filter: blur(10px);
        }
        .feature-card { 
            background: white; 
            border-radius: 15px; 
            box-shadow: 0 8px 25px rgba(0,0,0,0.1); 
            transition: all 0.3s ease;
            border: 1px solid rgba(102, 126, 234, 0.1);
        }
        .feature-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }
        .url-card {
            background: linear-gradient(45deg, #f8f9fa, #e9ecef);
            border-left: 4px solid #667eea;
            transition: all 0.3s ease;
        }
        .url-card:hover {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
        }
        .badge-custom {
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
            padding: 8px 15px;
            border-radius: 25px;
        }
        .tech-badge {
            background: linear-gradient(45deg, #6c757d, #495057);
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.85em;
        }
        .demo-header {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .code-snippet {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 10px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
        }
        .live-demo-btn {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .live-demo-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-5">
        <div class="row justify-content-center">
            <div class="col-lg-11 col-xl-10">
                <div class="demo-container p-5">
                    <!-- Header -->
                    <div class="text-center mb-5">
                        <h1 class="display-3 fw-bold demo-header mb-3">
                            <i class="fas fa-blog"></i> MVC Blog Application
                        </h1>
                        <p class="lead text-muted mb-3">Lab 3 - Web Nâng Cao | ASP.NET MVC Demo Project</p>
                        <div class="d-flex justify-content-center gap-3 mb-4">
                            <span class="badge-custom"><i class="fas fa-check-circle"></i> Lab 3 Complete</span>
                            <span class="tech-badge"><i class="fab fa-microsoft"></i> ASP.NET MVC 5</span>
                            <span class="tech-badge"><i class="fas fa-database"></i> Entity Framework</span>
                        </div>
                    </div>

                    <!-- Requirements Completed -->
                    <div class="row mb-5">
                        <div class="col-12">
                            <div class="feature-card p-4">
                                <h4 class="text-success mb-3">
                                    <i class="fas fa-tasks"></i> Yêu cầu đề bài đã hoàn thành
                                </h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="list-unstyled">
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>Câu c:</strong> Tạo Controllers</li>
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>BlogController.cs</strong> với Get(id) và Index()</li>
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>PostController.cs</strong> với Get(id) và Index()</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <ul class="list-unstyled">
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>RouteConfig.cs</strong> cấu hình routing</li>
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>Views</strong> đầy đủ cho tất cả actions</li>
                                            <li class="mb-2"><i class="fas fa-check text-success me-2"></i><strong>Entity Framework</strong> integration</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- URL Patterns -->
                    <div class="row mb-5">
                        <div class="col-md-6 mb-4">
                            <div class="feature-card p-4 h-100">
                                <h5 class="text-primary mb-4">
                                    <i class="fas fa-blog"></i> Blog Management URLs
                                </h5>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Tất cả Blogs:</strong><br>
                                    <code>/Blog</code> hoặc <code>/Blog/Index</code>
                                </div>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Chi tiết Blog:</strong><br>
                                    <code>/Blog/Get/1</code> (BlogID = 1)
                                </div>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Tìm kiếm Blog:</strong><br>
                                    <code>/Blog/Search?keyword=test</code>
                                </div>
                                <div class="url-card p-3 rounded">
                                    <strong>Blogs gần đây:</strong><br>
                                    <code>/Blog/Recent</code>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="feature-card p-4 h-100">
                                <h5 class="text-success mb-4">
                                    <i class="fas fa-edit"></i> Post Management URLs
                                </h5>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Tất cả Posts:</strong><br>
                                    <code>/Post</code> hoặc <code>/Post/Index</code>
                                </div>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Chi tiết Post:</strong><br>
                                    <code>/Post/Get/1</code> (PostID = 1)
                                </div>
                                <div class="url-card p-3 mb-3 rounded">
                                    <strong>Posts theo Tag:</strong><br>
                                    <code>/Post/ByTag?tag=technology</code>
                                </div>
                                <div class="url-card p-3 rounded">
                                    <strong>Tất cả Tags:</strong><br>
                                    <code>/Post/Tags</code>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Technical Architecture -->
                    <div class="row mb-5">
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-4 text-center h-100">
                                <i class="fas fa-cogs fa-3x text-primary mb-3"></i>
                                <h5>Architecture</h5>
                                <p class="text-muted">ASP.NET MVC 5.2.9<br>3-tier Architecture<br>Code-First Entity Framework</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-4 text-center h-100">
                                <i class="fas fa-database fa-3x text-success mb-3"></i>
                                <h5>Database</h5>
                                <p class="text-muted">SQL Server LocalDB<br>Entity Framework 6.4.4<br>Blog & Post Models</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-4 text-center h-100">
                                <i class="fas fa-paint-brush fa-3x text-warning mb-3"></i>
                                <h5>Frontend</h5>
                                <p class="text-muted">Razor Views<br>Bootstrap 5<br>Responsive Design</p>
                            </div>
                        </div>
                    </div>

                    <!-- Running Instructions -->
                    <div class="feature-card p-4 mb-5">
                        <h4 class="text-info mb-3">
                            <i class="fas fa-play-circle"></i> Cách chạy ứng dụng
                        </h4>
                        <div class="row">
                            <div class="col-md-6">
                                <h6><i class="fas fa-desktop"></i> Chạy trên Local (Khuyên dùng):</h6>
                                <ol>
                                    <li>Mở <strong>Visual Studio</strong></li>
                                    <li>Mở file <code>MvcBlog.csproj</code></li>
                                    <li>Build solution (Ctrl + Shift + B)</li>
                                    <li>Run ứng dụng (F5)</li>
                                </ol>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-cloud"></i> Deploy lên Cloud:</h6>
                                <ul class="list-unstyled">
                                    <li><code>deploy-azure.ps1</code> - Azure App Service</li>
                                    <li><code>deploy-google-cloud.ps1</code> - Google Cloud</li>
                                    <li><code>deploy-netlify.ps1</code> - Netlify Demo</li>
                                </ul>
                            </div>
                        </div>
                        <div class="alert alert-warning mt-3">
                            <i class="fas fa-exclamation-triangle"></i> 
                            <strong>Lưu ý:</strong> ASP.NET MVC 5 không chạy được bằng <code>dotnet CLI</code>. 
                            Cần sử dụng Visual Studio để build và run.
                        </div>
                    </div>

                    <!-- Project Structure -->
                    <div class="feature-card p-4 mb-5">
                        <h4 class="text-secondary mb-3">
                            <i class="fas fa-folder-tree"></i> Cấu trúc Project
                        </h4>
                        <div class="code-snippet">
MvcBlog/
├── Controllers/          <span class="text-success"># BlogController, PostController</span>
├── Views/               <span class="text-success"># Razor Views (Blog/, Post/, Shared/)</span>
├── App_Start/           <span class="text-success"># RouteConfig, FilterConfig</span>
├── Content/             <span class="text-success"># CSS, Images</span>
├── Models/              <span class="text-success"># View Models</span>
├── References/          <span class="text-success"># EntityModel & EntityController từ Lab 2</span>
└── Web.config           <span class="text-success"># Configuration</span>
                        </div>
                    </div>

                    <!-- Demo Link -->
                    <div class="text-center">
                        <h4 class="mb-4">🔗 Demo Links</h4>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="https://github.com/jkhoa/mvc-blog-lab3" class="live-demo-btn btn">
                                <i class="fab fa-github"></i> GitHub Repository
                            </a>
                            <a href="#" class="live-demo-btn btn" onclick="alert('Chạy local bằng Visual Studio để xem demo đầy đủ!')">
                                <i class="fas fa-eye"></i> Live Demo (Local)
                            </a>
                            <a href="mailto:?subject=MVC Blog Lab 3 Demo&body=Xem demo MVC Blog Application tại: " class="live-demo-btn btn">
                                <i class="fas fa-share"></i> Share Demo
                            </a>
                        </div>
                        <p class="text-muted mt-3">
                            <i class="fas fa-info-circle"></i> 
                            Để xem demo đầy đủ với database, vui lòng chạy ứng dụng bằng Visual Studio
                        </p>
                    </div>

                    <!-- Footer -->
                    <div class="text-center mt-5 pt-4 border-top">
                        <p class="text-muted">
                            <i class="fas fa-graduation-cap"></i> 
                            <strong>Lab 3 - Web Nâng Cao</strong> | ASP.NET MVC Blog Application<br>
                            <i class="fas fa-check-circle text-success"></i> 
                            Hoàn thành 100% yêu cầu đề bài
                        </p>
                        <div class="mt-3">
                            <span class="badge bg-primary me-2">ASP.NET MVC</span>
                            <span class="badge bg-success me-2">Entity Framework</span>
                            <span class="badge bg-info me-2">SQL Server</span>
                            <span class="badge bg-warning text-dark">Bootstrap</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Thêm animation cho cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.feature-card');
            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.style.animation = 'fadeInUp 0.6s ease forwards';
            });
        });

        // CSS animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
"@

# Tạo thư mục docs cho GitHub Pages
New-Item -ItemType Directory -Force -Path "docs"
$demoPage | Out-File -FilePath "docs/index.html" -Encoding UTF8

Write-Host "✅ Đã tạo demo page tại docs/index.html" -ForegroundColor Green

# Tạo GitHub Pages setup script
$githubPagesSetup = @"
# Setup GitHub Pages cho demo MVC Blog

Write-Host "🚀 Setting up GitHub Pages for MVC Blog Demo..." -ForegroundColor Green

# Initialize git repository if not exists
if (!(Test-Path ".git")) {
    git init
    Write-Host "✅ Initialized git repository" -ForegroundColor Green
}

# Add all files
git add .
git commit -m "Add MVC Blog Lab 3 demo page"

# Kiểm tra GitHub remote
`$remote = git remote get-url origin 2>`$null
if ([string]::IsNullOrEmpty(`$remote)) {
    Write-Host "⚠️  Chưa có GitHub remote. Vui lòng:" -ForegroundColor Yellow
    Write-Host "   1. Tạo repository trên GitHub" -ForegroundColor Cyan
    Write-Host "   2. Chạy: git remote add origin <your-repo-url>" -ForegroundColor Cyan
    Write-Host "   3. Chạy lại script này" -ForegroundColor Cyan
    exit 1
}

# Push to GitHub
git push origin main

Write-Host "🎉 Demo đã được push lên GitHub!" -ForegroundColor Green
Write-Host "📝 Bước tiếp theo:" -ForegroundColor Yellow
Write-Host "   1. Vào GitHub repository" -ForegroundColor Cyan
Write-Host "   2. Settings > Pages" -ForegroundColor Cyan
Write-Host "   3. Source: Deploy from a branch" -ForegroundColor Cyan
Write-Host "   4. Branch: main, Folder: /docs" -ForegroundColor Cyan
Write-Host "   5. Save" -ForegroundColor Cyan

`$repoUrl = git remote get-url origin
`$repoName = (`$repoUrl -split '/')[-1] -replace '\.git', ''
`$username = (`$repoUrl -split '/')[-2] -split ':')[-1]
`$pagesUrl = "https://`$username.github.io/`$repoName"

Write-Host "🔗 Demo URL sẽ là: `$pagesUrl" -ForegroundColor Cyan
Write-Host "⏰ Đợi 5-10 phút để GitHub Pages deploy" -ForegroundColor Yellow

Write-Host "✅ Setup hoàn tất!" -ForegroundColor Green
"@

$githubPagesSetup | Out-File -FilePath "setup-github-pages.ps1" -Encoding UTF8

Write-Host "✅ Đã tạo setup-github-pages.ps1" -ForegroundColor Green

# Tạo quick demo script
$quickDemo = @"
# Quick Demo Script - Mở demo page local

Write-Host "🚀 Opening MVC Blog Demo..." -ForegroundColor Green

# Kiểm tra file demo
if (Test-Path "docs/index.html") {
    `$demoPath = Resolve-Path "docs/index.html"
    Write-Host "✅ Tìm thấy demo page: `$demoPath" -ForegroundColor Green
    
    # Mở browser
    Start-Process `$demoPath
    Write-Host "🌐 Đã mở demo page trong browser" -ForegroundColor Cyan
} else {
    Write-Host "❌ Không tìm thấy demo page. Chạy deploy-demo.ps1 trước" -ForegroundColor Red
}

Write-Host "📝 Demo URLs khi chạy ứng dụng thực:" -ForegroundColor Yellow
Write-Host "   http://localhost:port/Blog" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Blog/Get/1" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Post" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Post/Get/1" -ForegroundColor Cyan

Write-Host "✅ Quick demo hoàn tất!" -ForegroundColor Green
"@

$quickDemo | Out-File -FilePath "quick-demo.ps1" -Encoding UTF8

Write-Host "✅ Đã tạo quick-demo.ps1" -ForegroundColor Green

# Chạy quick demo ngay
Write-Host "🌐 Mở demo page..." -ForegroundColor Yellow
Start-Process (Resolve-Path "docs/index.html")

Write-Host "`n🎉 Đã tạo xong demo links!" -ForegroundColor Green
Write-Host "📁 Các file đã tạo:" -ForegroundColor Cyan
Write-Host "   docs/index.html - Demo page" -ForegroundColor White
Write-Host "   setup-github-pages.ps1 - Setup GitHub Pages" -ForegroundColor White
Write-Host "   quick-demo.ps1 - Mở demo nhanh" -ForegroundColor White
Write-Host "   deploy-azure.ps1 - Deploy lên Azure" -ForegroundColor White
Write-Host "   deploy-google-cloud.ps1 - Deploy lên Google Cloud" -ForegroundColor White
Write-Host "   deploy-netlify.ps1 - Deploy lên Netlify" -ForegroundColor White

Write-Host "`n🔗 Các cách tạo link demo:" -ForegroundColor Yellow
Write-Host "   1. Local: Chạy quick-demo.ps1" -ForegroundColor Cyan
Write-Host "   2. GitHub Pages: Chạy setup-github-pages.ps1" -ForegroundColor Cyan
Write-Host "   3. Cloud hosting: Chạy deploy-*.ps1" -ForegroundColor Cyan
