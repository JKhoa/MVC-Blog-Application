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
$remote = git remote get-url origin 2>$null
if ([string]::IsNullOrEmpty($remote)) {
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

$repoUrl = git remote get-url origin
$repoName = ($repoUrl -split '/')[-1] -replace '\.git', ''
$username = ($repoUrl -split '/')[-2] -split ':')[-1]
$pagesUrl = "https://$username.github.io/$repoName"

Write-Host "🔗 Demo URL sẽ là: $pagesUrl" -ForegroundColor Cyan
Write-Host "⏰ Đợi 5-10 phút để GitHub Pages deploy" -ForegroundColor Yellow

Write-Host "✅ Setup hoàn tất!" -ForegroundColor Green
