# 🚀 快速部署脚本
# 用于快速提交和推送 Asakushen 个人主页的更改

param(
    [string]$Message = "🎨 更新个人主页内容",
    [switch]$SkipHealthCheck = $false,
    [switch]$Force = $false
)

Write-Host "🚀 开始部署流程..." -ForegroundColor Green

# =============================================================================
# 🏥 健康检查 (可选)
# =============================================================================

if (-not $SkipHealthCheck) {
    Write-Host "`n🏥 运行健康检查..." -ForegroundColor Yellow
    
    if (Test-Path "scripts\health-check.ps1") {
        & "scripts\health-check.ps1"
        
        if (-not $Force) {
            $continue = Read-Host "`n是否继续部署? (y/N)"
            if ($continue -ne "y" -and $continue -ne "Y") {
                Write-Host "❌ 部署已取消" -ForegroundColor Red
                exit 1
            }
        }
    } else {
        Write-Host "⚠️  健康检查脚本不存在，跳过检查" -ForegroundColor Yellow
    }
}

# =============================================================================
# 📊 检查更改
# =============================================================================

Write-Host "`n📊 检查文件更改..." -ForegroundColor Yellow

try {
    $gitStatus = git status --porcelain
    
    if (-not $gitStatus) {
        Write-Host "ℹ️  没有检测到更改，无需部署" -ForegroundColor Cyan
        exit 0
    }
    
    Write-Host "📝 检测到以下更改:" -ForegroundColor Cyan
    git status --short
    
} catch {
    Write-Host "❌ Git 状态检查失败" -ForegroundColor Red
    exit 1
}

# =============================================================================
# 🔍 预提交检查
# =============================================================================

Write-Host "`n🔍 预提交检查..." -ForegroundColor Yellow

# 检查是否有大文件
$largeFiles = git diff --cached --name-only | ForEach-Object {
    if (Test-Path $_) {
        $file = Get-Item $_
        if ($file.Length -gt 10MB) {
            return $file
        }
    }
}

if ($largeFiles) {
    Write-Host "⚠️  警告: 检测到大文件 (>10MB):" -ForegroundColor Red
    foreach ($file in $largeFiles) {
        $sizeMB = [math]::Round($file.Length / 1MB, 2)
        Write-Host "   📄 $($file.Name): $sizeMB MB" -ForegroundColor Yellow
    }
    
    if (-not $Force) {
        $continue = Read-Host "是否继续提交大文件? 建议使用 Git LFS (y/N)"
        if ($continue -ne "y" -and $continue -ne "Y") {
            Write-Host "❌ 部署已取消" -ForegroundColor Red
            Write-Host "💡 使用 'git lfs track `"*.gif`"' 来跟踪大文件" -ForegroundColor Cyan
            exit 1
        }
    }
}

# =============================================================================
# 📦 添加文件
# =============================================================================

Write-Host "`n📦 添加文件到暂存区..." -ForegroundColor Yellow

try {
    git add .
    Write-Host "✅ 文件已添加到暂存区" -ForegroundColor Green
} catch {
    Write-Host "❌ 添加文件失败" -ForegroundColor Red
    exit 1
}

# =============================================================================
# 💬 提交更改
# =============================================================================

Write-Host "`n💬 提交更改..." -ForegroundColor Yellow

# 生成详细的提交信息
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$detailedMessage = @"
$Message

🕒 提交时间: $timestamp
📊 更改统计:
$(git diff --cached --stat)

🔧 自动部署脚本生成
"@

try {
    git commit -m $detailedMessage
    Write-Host "✅ 更改已提交" -ForegroundColor Green
} catch {
    Write-Host "❌ 提交失败" -ForegroundColor Red
    exit 1
}

# =============================================================================
# 🌐 推送到远程
# =============================================================================

Write-Host "`n🌐 推送到 GitHub..." -ForegroundColor Yellow

try {
    git push origin main
    Write-Host "✅ 成功推送到 GitHub!" -ForegroundColor Green
} catch {
    Write-Host "❌ 推送失败" -ForegroundColor Red
    Write-Host "💡 请检查网络连接和 GitHub 权限" -ForegroundColor Cyan
    exit 1
}

# =============================================================================
# 🎯 部署完成
# =============================================================================

Write-Host "`n🎉 部署完成!" -ForegroundColor Green

# 显示仓库信息
try {
    $repoUrl = git config --get remote.origin.url
    $repoUrl = $repoUrl -replace "\.git$", ""
    $repoUrl = $repoUrl -replace "git@github\.com:", "https://github.com/"
    
    Write-Host "`n🔗 相关链接:" -ForegroundColor Cyan
    Write-Host "   📦 仓库地址: $repoUrl" -ForegroundColor Yellow
    Write-Host "   👤 个人主页: https://github.com/Asakushen" -ForegroundColor Yellow
    Write-Host "   🌐 个人博客: https://www.chillg.de" -ForegroundColor Yellow
    
} catch {
    Write-Host "ℹ️  无法获取仓库信息" -ForegroundColor Yellow
}

# =============================================================================
# 📈 后续建议
# =============================================================================

Write-Host "`n📈 后续建议:" -ForegroundColor Yellow
Write-Host "1. 🔍 检查 GitHub Actions 是否正常运行" -ForegroundColor Cyan
Write-Host "2. 👀 查看个人主页是否正确显示" -ForegroundColor Cyan
Write-Host "3. 📊 监控仓库大小变化" -ForegroundColor Cyan
Write-Host "4. 🔄 等待自动生成的统计图表更新 (可能需要几分钟)" -ForegroundColor Cyan

Write-Host "`n💡 使用参数:" -ForegroundColor Yellow
Write-Host "   -Message `"自定义提交信息`"" -ForegroundColor Cyan
Write-Host "   -SkipHealthCheck (跳过健康检查)" -ForegroundColor Cyan
Write-Host "   -Force (强制执行，跳过确认)" -ForegroundColor Cyan

Write-Host "`n🎯 部署流程结束!" -ForegroundColor Green