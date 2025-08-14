# Deploy ASP.NET MVC Blog to Azure App Service
# Yêu cầu: Azure CLI đã được cài đặt và đăng nhập

Write-Host "🚀 Deploying MVC Blog to Azure App Service..." -ForegroundColor Green

# Kiểm tra Azure CLI
try {
    az --version | Out-Null
    Write-Host "✅ Azure CLI đã sẵn sàng" -ForegroundColor Green
} catch {
    Write-Host "❌ Vui lòng cài đặt Azure CLI trước" -ForegroundColor Red
    Write-Host "Download tại: https://aka.ms/installazurecliwindows" -ForegroundColor Yellow
    exit 1
}

# Kiểm tra đăng nhập Azure
$account = az account show --query "user.name" -o tsv
if ([string]::IsNullOrEmpty($account)) {
    Write-Host "❌ Vui lòng đăng nhập Azure trước: az login" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Đã đăng nhập Azure với tài khoản: $account" -ForegroundColor Green

# Thông tin cấu hình
$resourceGroup = "mvc-blog-rg"
$appName = "mvc-blog-app-$(Get-Random -Minimum 1000 -Maximum 9999)"
$location = "East US"
$sku = "F1"  # Free tier

Write-Host "📝 Cấu hình deployment:" -ForegroundColor Yellow
Write-Host "   Resource Group: $resourceGroup" -ForegroundColor Cyan
Write-Host "   App Name: $appName" -ForegroundColor Cyan
Write-Host "   Location: $location" -ForegroundColor Cyan
Write-Host "   SKU: $sku (Free)" -ForegroundColor Cyan

# Tạo Resource Group
Write-Host "📦 Tạo Resource Group..." -ForegroundColor Yellow
az group create --name $resourceGroup --location $location

# Tạo App Service Plan
Write-Host "📋 Tạo App Service Plan..." -ForegroundColor Yellow
az appservice plan create --name "$appName-plan" --resource-group $resourceGroup --sku $sku

# Tạo Web App
Write-Host "🌐 Tạo Web App..." -ForegroundColor Yellow
az webapp create --name $appName --resource-group $resourceGroup --plan "$appName-plan" --runtime "DOTNETCORE|6.0"

# Cấu hình deployment từ local Git
Write-Host "🔧 Cấu hình deployment..." -ForegroundColor Yellow
az webapp deployment source config-local-git --name $appName --resource-group $resourceGroup

# Lấy deployment credentials
$credentials = az webapp deployment list-publishing-credentials --name $appName --resource-group $resourceGroup --query "{username:publishingUserName, password:publishingPassword}" -o json | ConvertFrom-Json

# Tạo Git repository và deploy
Write-Host "📚 Chuẩn bị Git deployment..." -ForegroundColor Yellow

# Initialize git if not exists
if (!(Test-Path ".git")) {
    git init
    git add .
    git commit -m "Initial commit - MVC Blog Application"
}

# Add Azure remote
$gitUrl = "https://$($credentials.username):$($credentials.password)@$appName.scm.azurewebsites.net/$appName.git"
git remote remove azure -ErrorAction SilentlyContinue
git remote add azure $gitUrl

# Deploy
Write-Host "🚀 Deploying to Azure..." -ForegroundColor Yellow
git push azure main

# Lấy URL của ứng dụng
$appUrl = "https://$appName.azurewebsites.net"

Write-Host "🎉 Deployment hoàn tất!" -ForegroundColor Green
Write-Host "🔗 URL ứng dụng: $appUrl" -ForegroundColor Cyan
Write-Host "📱 Bạn có thể truy cập ứng dụng tại: $appUrl" -ForegroundColor Cyan

# Mở browser
$openBrowser = Read-Host "Bạn có muốn mở browser ngay không? (y/n)"
if ($openBrowser -eq "y" -or $openBrowser -eq "Y") {
    Start-Process $appUrl
}

# Hiển thị thông tin quản lý
Write-Host "`n📊 Thông tin quản lý:" -ForegroundColor Yellow
Write-Host "   Azure Portal: https://portal.azure.com" -ForegroundColor Cyan
Write-Host "   Resource Group: $resourceGroup" -ForegroundColor Cyan
Write-Host "   App Service: $appName" -ForegroundColor Cyan

Write-Host "✅ Script hoàn tất!" -ForegroundColor Green
