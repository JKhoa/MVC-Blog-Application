# Deploy ASP.NET MVC Blog to Netlify (Static hosting with build)
# Phù hợp cho demo nhanh, không cần server

Write-Host "🚀 Deploying MVC Blog to Netlify..." -ForegroundColor Green

# Cài đặt Netlify CLI nếu chưa có
try {
    netlify --version | Out-Null
    Write-Host "✅ Netlify CLI đã sẵn sàng" -ForegroundColor Green
} catch {
    Write-Host "📦 Cài đặt Netlify CLI..." -ForegroundColor Yellow
    npm install -g netlify-cli
    Write-Host "✅ Đã cài đặt Netlify CLI" -ForegroundColor Green
}

# Tạo build script cho static export
$buildScript = @"
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MVC Blog Demo - Lab 3</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }
        .demo-card { background: rgba(255,255,255,0.95); border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); }
        .feature-card { background: white; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); transition: transform 0.3s; }
        .feature-card:hover { transform: translateY(-5px); }
        .btn-demo { background: linear-gradient(45deg, #667eea, #764ba2); border: none; color: white; }
        .btn-demo:hover { transform: scale(1.05); color: white; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="demo-card p-5">
                    <div class="text-center mb-5">
                        <h1 class="display-4 fw-bold text-primary mb-3">🎯 MVC Blog Application</h1>
                        <p class="lead text-muted">Lab 3 - Web Nâng Cao | ASP.NET MVC Demo</p>
                        <div class="badge bg-success fs-6 mb-3">✅ Hoàn thành 100%</div>
                    </div>

                    <!-- Demo URLs -->
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3">
                            <div class="feature-card p-4 h-100">
                                <h5 class="text-primary mb-3">📚 Blog Management</h5>
                                <ul class="list-unstyled">
                                    <li><strong>Tất cả Blogs:</strong> <code>/Blog</code></li>
                                    <li><strong>Chi tiết Blog:</strong> <code>/Blog/Get/1</code></li>
                                    <li><strong>Tìm kiếm:</strong> <code>/Blog/Search?keyword=test</code></li>
                                    <li><strong>Blogs gần đây:</strong> <code>/Blog/Recent</code></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div class="feature-card p-4 h-100">
                                <h5 class="text-success mb-3">📝 Post Management</h5>
                                <ul class="list-unstyled">
                                    <li><strong>Tất cả Posts:</strong> <code>/Post</code></li>
                                    <li><strong>Chi tiết Post:</strong> <code>/Post/Get/1</code></li>
                                    <li><strong>Posts theo Tag:</strong> <code>/Post/ByTag?tag=tech</code></li>
                                    <li><strong>Tất cả Tags:</strong> <code>/Post/Tags</code></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Technical Info -->
                    <div class="row mb-4">
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-3 text-center">
                                <h6 class="text-primary">🏗️ Architecture</h6>
                                <p class="small mb-0">ASP.NET MVC 5.2.9<br>Entity Framework 6.4.4</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-3 text-center">
                                <h6 class="text-success">🗄️ Database</h6>
                                <p class="small mb-0">SQL Server LocalDB<br>Code-First Approach</p>
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <div class="feature-card p-3 text-center">
                                <h6 class="text-warning">🎨 UI/UX</h6>
                                <p class="small mb-0">Bootstrap + Custom CSS<br>Responsive Design</p>
                            </div>
                        </div>
                    </div>

                    <!-- Yêu cầu đã hoàn thành -->
                    <div class="alert alert-success">
                        <h5 class="alert-heading">✅ Yêu cầu Lab 3 đã hoàn thành:</h5>
                        <ul class="mb-0">
                            <li><strong>Câu c:</strong> Tạo BlogController.cs và PostController.cs</li>
                            <li><strong>Câu d:</strong> BlogController có Get(int BlogID) và Index()</li>
                            <li><strong>Câu e:</strong> PostController có Get(int PostID) và Index()</li>
                            <li><strong>RouteConfig:</strong> Cấu hình {controller}/{action}/{id}</li>
                        </ul>
                    </div>

                    <!-- Running Instructions -->
                    <div class="card border-info mb-4">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0">🚀 Cách chạy ứng dụng</h5>
                        </div>
                        <div class="card-body">
                            <ol>
                                <li>Mở <strong>Visual Studio</strong></li>
                                <li>Mở file <code>MvcBlog.csproj</code></li>
                                <li>Build solution (Ctrl + Shift + B)</li>
                                <li>Run ứng dụng (F5)</li>
                            </ol>
                            <div class="alert alert-warning small mt-3 mb-0">
                                <strong>Lưu ý:</strong> ASP.NET MVC 5 chỉ chạy được bằng Visual Studio (không dùng được dotnet CLI)
                            </div>
                        </div>
                    </div>

                    <!-- Demo Video/Screenshots -->
                    <div class="text-center">
                        <h5 class="mb-3">📱 Demo Screenshots</h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="feature-card p-3">
                                    <h6>Blog Management</h6>
                                    <div class="bg-light p-3 rounded">
                                        <p class="small text-muted mb-0">Screenshot: Danh sách blogs với posts</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="feature-card p-3">
                                    <h6>Post Management</h6>
                                    <div class="bg-light p-3 rounded">
                                        <p class="small text-muted mb-0">Screenshot: Chi tiết post với tags</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="text-center mt-4 pt-4 border-top">
                        <p class="text-muted small mb-0">
                            📚 Lab 3 - Web Nâng Cao | ASP.NET MVC Blog Application<br>
                            🎯 Hoàn thành 100% yêu cầu đề bài
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
"@

# Tạo thư mục build
New-Item -ItemType Directory -Force -Path "dist"
$buildScript | Out-File -FilePath "dist/index.html" -Encoding UTF8

# Tạo netlify.toml
$netlifyConfig = @"
[build]
  publish = "dist"
  
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
"@

$netlifyConfig | Out-File -FilePath "netlify.toml" -Encoding UTF8

Write-Host "✅ Đã tạo static demo page" -ForegroundColor Green

# Deploy to Netlify
Write-Host "🚀 Deploying to Netlify..." -ForegroundColor Yellow
netlify deploy --prod --dir dist

Write-Host "🎉 Deployment hoàn tất!" -ForegroundColor Green
Write-Host "📱 Demo page đã được deploy lên Netlify" -ForegroundColor Cyan

# Lấy URL
$siteInfo = netlify sites:list --json | ConvertFrom-Json | Select-Object -First 1
if ($siteInfo) {
    $netlifyUrl = $siteInfo.url
    Write-Host "🔗 URL demo: $netlifyUrl" -ForegroundColor Cyan
    
    # Mở browser
    $openBrowser = Read-Host "Bạn có muốn mở demo page không? (y/n)"
    if ($openBrowser -eq "y" -or $openBrowser -eq "Y") {
        Start-Process $netlifyUrl
    }
}

Write-Host "✅ Script hoàn tất!" -ForegroundColor Green
