# Quick Demo Script - Mở demo page local đã được tối ưu

Write-Host "🚀 Opening Optimized MVC Blog Demo..." -ForegroundColor Green

# Kiểm tra file demo
if (Test-Path "docs/index.html") {
    $demoPath = Resolve-Path "docs/index.html"
    Write-Host "✅ Tìm thấy optimized demo page: $demoPath" -ForegroundColor Green
    
    # Mở browser
    Start-Process $demoPath
    Write-Host "🌐 Đã mở demo page trong browser với:" -ForegroundColor Cyan
    Write-Host "   • GitHub Repository link: https://github.com/JKhoa/Study" -ForegroundColor White
    Write-Host "   • Open in VS Code functionality" -ForegroundColor White
    Write-Host "   • Simplified clean interface" -ForegroundColor White
} else {
    Write-Host "❌ Không tìm thấy demo page. Chạy create-demo-links.ps1 trước" -ForegroundColor Red
}

Write-Host "`n🌐 Online Demo Link:" -ForegroundColor Yellow
Write-Host "   https://jkhoa.github.io/Study/Web_Nang_Cao/Lab3/MvcBlog/docs/" -ForegroundColor Cyan

Write-Host "`n📝 Local URLs khi chạy ứng dụng thực:" -ForegroundColor Yellow
Write-Host "   http://localhost:port/Blog" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Blog/Get/1" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Post" -ForegroundColor Cyan
Write-Host "   http://localhost:port/Post/Get/1" -ForegroundColor Cyan

Write-Host "✅ Quick demo hoàn tất!" -ForegroundColor Green
