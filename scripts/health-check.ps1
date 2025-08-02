# 🏥 仓库健康检查脚本
# 用于检查和优化 Asakushen 个人主页仓库

Write-Host "🚀 开始仓库健康检查..." -ForegroundColor Green

# =============================================================================
# 📊 仓库大小检查
# =============================================================================

Write-Host "`n📊 检查仓库大小..." -ForegroundColor Yellow

# 检查仓库总大小
$repoSize = (Get-ChildItem -Recurse | Measure-Object -Property Length -Sum).Sum
$repoSizeMB = [math]::Round($repoSize / 1MB, 2)

Write-Host "📦 仓库总大小: $repoSizeMB MB" -ForegroundColor Cyan

if ($repoSizeMB -gt 100) {
    Write-Host "⚠️  警告: 仓库大小超过100MB，建议优化" -ForegroundColor Red
} else {
    Write-Host "✅ 仓库大小正常" -ForegroundColor Green
}

# =============================================================================
# 🔍 大文件检查
# =============================================================================

Write-Host "`n🔍 检查大文件 (>5MB)..." -ForegroundColor Yellow

$largeFiles = Get-ChildItem -Recurse | Where-Object { $_.Length -gt 5MB } | Sort-Object Length -Descending

if ($largeFiles.Count -gt 0) {
    Write-Host "📁 发现大文件:" -ForegroundColor Red
    foreach ($file in $largeFiles) {
        $sizeMB = [math]::Round($file.Length / 1MB, 2)
        Write-Host "   📄 $($file.Name): $sizeMB MB" -ForegroundColor Yellow
    }
    Write-Host "💡 建议: 考虑使用 Git LFS 管理这些大文件" -ForegroundColor Cyan
} else {
    Write-Host "✅ 没有发现大文件" -ForegroundColor Green
}

# =============================================================================
# 🎯 Git 状态检查
# =============================================================================

Write-Host "`n🎯 检查 Git 状态..." -ForegroundColor Yellow

try {
    $gitStatus = git status --porcelain
    if ($gitStatus) {
        Write-Host "📝 有未提交的更改:" -ForegroundColor Yellow
        git status --short
    } else {
        Write-Host "✅ 工作目录干净" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Git 状态检查失败" -ForegroundColor Red
}

# =============================================================================
# 📈 提交历史检查
# =============================================================================

Write-Host "`n📈 检查最近的提交..." -ForegroundColor Yellow

try {
    $recentCommits = git log --oneline -10
    $generatedCommits = ($recentCommits | Where-Object { $_ -match "generated" }).Count
    
    if ($generatedCommits -gt 5) {
        Write-Host "⚠️  警告: 最近10次提交中有 $generatedCommits 次是自动生成的" -ForegroundColor Red
        Write-Host "💡 建议: 考虑减少 GitHub Actions 的运行频率" -ForegroundColor Cyan
    } else {
        Write-Host "✅ 提交历史正常" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ 提交历史检查失败" -ForegroundColor Red
}

# =============================================================================
# 🔧 文件完整性检查
# =============================================================================

Write-Host "`n🔧 检查关键文件..." -ForegroundColor Yellow

$criticalFiles = @(
    "README.md",
    "LICENSE",
    ".gitignore",
    "CONTRIBUTING.md",
    "CODE_OF_CONDUCT.md"
)

foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file 存在" -ForegroundColor Green
    } else {
        Write-Host "❌ $file 缺失" -ForegroundColor Red
    }
}

# =============================================================================
# 🎨 SVG 文件检查
# =============================================================================

Write-Host "`n🎨 检查 SVG 动画文件..." -ForegroundColor Yellow

$svgFiles = Get-ChildItem -Path "assets" -Filter "*.svg" -ErrorAction SilentlyContinue

if ($svgFiles) {
    Write-Host "🎭 发现 SVG 文件:" -ForegroundColor Cyan
    foreach ($svg in $svgFiles) {
        $sizeMB = [math]::Round($svg.Length / 1KB, 2)
        Write-Host "   🎨 $($svg.Name): $sizeMB KB" -ForegroundColor Yellow
    }
} else {
    Write-Host "❌ 没有发现 SVG 文件" -ForegroundColor Red
}

# =============================================================================
# 🌐 链接检查 (简单版)
# =============================================================================

Write-Host "`n🌐 检查 README.md 中的链接..." -ForegroundColor Yellow

if (Test-Path "README.md") {
    $readmeContent = Get-Content "README.md" -Raw
    $links = [regex]::Matches($readmeContent, 'https?://[^\s\)]+')
    
    Write-Host "🔗 发现 $($links.Count) 个链接" -ForegroundColor Cyan
    
    # 检查一些关键链接
    $keyLinks = @(
        "https://www.chillg.de",
        "mailto:hi@chillg.de"
    )
    
    foreach ($link in $keyLinks) {
        if ($readmeContent -match [regex]::Escape($link)) {
            Write-Host "✅ 关键链接存在: $link" -ForegroundColor Green
        } else {
            Write-Host "❌ 关键链接缺失: $link" -ForegroundColor Red
        }
    }
}

# =============================================================================
# 📋 优化建议
# =============================================================================

Write-Host "`n📋 优化建议:" -ForegroundColor Yellow

Write-Host "1. 🗂️  定期运行此脚本检查仓库健康状态" -ForegroundColor Cyan
Write-Host "2. 📦 如果仓库大小超过100MB，考虑使用 Git LFS" -ForegroundColor Cyan
Write-Host "3. 🔄 减少 GitHub Actions 的运行频率以避免频繁提交" -ForegroundColor Cyan
Write-Host "4. 🧹 定期清理不需要的文件和历史记录" -ForegroundColor Cyan
Write-Host "5. 📊 监控仓库大小变化趋势" -ForegroundColor Cyan

# =============================================================================
# 🎯 总结
# =============================================================================

Write-Host "`n🎯 健康检查完成!" -ForegroundColor Green
Write-Host "📊 仓库大小: $repoSizeMB MB" -ForegroundColor Cyan
Write-Host "📁 大文件数量: $($largeFiles.Count)" -ForegroundColor Cyan

if ($repoSizeMB -lt 50 -and $largeFiles.Count -eq 0) {
    Write-Host "🏆 仓库状态优秀!" -ForegroundColor Green
} elseif ($repoSizeMB -lt 100 -and $largeFiles.Count -lt 3) {
    Write-Host "👍 仓库状态良好" -ForegroundColor Yellow
} else {
    Write-Host "⚠️  仓库需要优化" -ForegroundColor Red
}

Write-Host "`n💡 运行 'git gc --aggressive --prune=now' 来优化 Git 仓库" -ForegroundColor Cyan
Write-Host "📚 查看 OPTIMIZATION_GUIDE.md 获取详细优化指南" -ForegroundColor Cyan