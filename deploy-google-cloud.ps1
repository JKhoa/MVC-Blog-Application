# Deploy ASP.NET MVC Blog to Google Cloud App Engine
# Yêu cầu: Google Cloud SDK đã được cài đặt và cấu hình

Write-Host "🚀 Deploying MVC Blog to Google Cloud App Engine..." -ForegroundColor Green

# Kiểm tra Google Cloud SDK
try {
    gcloud --version
    Write-Host "✅ Google Cloud SDK đã sẵn sàng" -ForegroundColor Green
} catch {
    Write-Host "❌ Vui lòng cài đặt Google Cloud SDK trước" -ForegroundColor Red
    Write-Host "Download tại: https://cloud.google.com/sdk/docs/install" -ForegroundColor Yellow
    exit 1
}

# Tạo app.yaml cho Google App Engine
$appYaml = @"
runtime: aspnetcore
env: standard

# Cấu hình cho ASP.NET Core
manual_scaling:
  instances: 1

env_variables:
  ASPNETCORE_ENVIRONMENT: Production
  
# Cấu hình kết nối database (sử dụng Google Cloud SQL)
beta_settings:
  cloud_sql_instances: your-project:region:instance-name
"@

$appYaml | Out-File -FilePath "app.yaml" -Encoding UTF8
Write-Host "✅ Đã tạo app.yaml" -ForegroundColor Green

# Tạo Dockerfile cho containerization
$dockerfile = @"
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MvcBlog.csproj", "."]
RUN dotnet restore "MvcBlog.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "MvcBlog.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MvcBlog.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MvcBlog.dll"]
"@

$dockerfile | Out-File -FilePath "Dockerfile" -Encoding UTF8
Write-Host "✅ Đã tạo Dockerfile" -ForegroundColor Green

# Kiểm tra project ID
$projectId = Read-Host "Nhập Google Cloud Project ID của bạn"
if ([string]::IsNullOrEmpty($projectId)) {
    Write-Host "❌ Project ID không được để trống" -ForegroundColor Red
    exit 1
}

# Set project
gcloud config set project $projectId
Write-Host "✅ Đã set project: $projectId" -ForegroundColor Green

# Enable App Engine
Write-Host "📝 Enabling App Engine..." -ForegroundColor Yellow
gcloud app create --region=us-central1

# Deploy to App Engine
Write-Host "🚀 Deploying to App Engine..." -ForegroundColor Yellow
gcloud app deploy --quiet

# Lấy URL của ứng dụng
$appUrl = gcloud app describe --format="value(defaultHostname)"
$fullUrl = "https://$appUrl"

Write-Host "🎉 Deployment hoàn tất!" -ForegroundColor Green
Write-Host "🔗 URL ứng dụng: $fullUrl" -ForegroundColor Cyan
Write-Host "📱 Bạn có thể truy cập ứng dụng tại: $fullUrl" -ForegroundColor Cyan

# Mở browser
$openBrowser = Read-Host "Bạn có muốn mở browser ngay không? (y/n)"
if ($openBrowser -eq "y" -or $openBrowser -eq "Y") {
    Start-Process $fullUrl
}

Write-Host "✅ Script hoàn tất!" -ForegroundColor Green
