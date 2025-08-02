# 🎯 Asakushen 个人主页管理工具
# 统一管理脚本，提供所有维护功能的入口

param(
    [Parameter(Position=0)]
    [ValidateSet("help", "health", "deploy", "optimize", "update", "preview", "status", "clean")]
    [string]$Action = "help",
    
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Arguments = @()
)

# 设置控制台编码
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "🎯 Asakushen 个人主页管理工具" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray
Write-Host "📅 $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Gray
Write-Host ""

# =============================================================================
# 🔧 工具函数
# =============================================================================

function Show-Help {
    Write-Host "📖 使用说明:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "🎯 可用命令:" -ForegroundColor Cyan
    Write-Host "   help      - 显示此帮助信息" -ForegroundColor Gray
    Write-Host "   health    - 运行仓库健康检查" -ForegroundColor Gray
    Write-Host "   deploy    - 快速部署更改到 GitHub" -ForegroundColor Gray
    Write-Host "   optimize  - 优化仓库大小和性能" -ForegroundColor Gray
    Write-Host "   update    - 更新 README 和项目信息" -ForegroundColor Gray
    Write-Host "   preview   - 生成本地预览" -ForegroundColor Gray
    Write-Host "   status    - 显示仓库状态" -ForegroundColor Gray
    Write-Host "   clean     - 清理临时文件" -ForegroundColor Gray
    Write-Host ""
    Write-Host "💡 使用示例:" -ForegroundColor Yellow
    Write-Host "   .\manage.ps1 health" -ForegroundColor Cyan
    Write-Host "   .\manage.ps1 deploy -Message `"更新内容`"" -ForegroundColor Cyan
    Write-Host "   .\manage.ps1 optimize -DryRun" -ForegroundColor Cyan
    Write-Host "   .\manage.ps1 update -All" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "🔗 相关链接:" -ForegroundColor Yellow
    Write-Host "   📦 GitHub: https://github.com/Asakushen" -ForegroundColor Cyan
    Write-Host "   🌐 博客: https://www.chillg.de" -ForegroundColor Cyan
    Write-Host "   📧 邮箱: hi@chillg.de" -ForegroundColor Cyan
}

function Test-ScriptExists {
    param([string]$ScriptName)
    $scriptPath = Join-Path $PSScriptRoot $ScriptName
    return Test-Path $scriptPath
}

function Invoke-Script {
    param(
        [string]$ScriptName,
        [string[]]$ScriptArguments = @()
    )
    
    $scriptPath = Join-Path $PSScriptRoot $ScriptName
    
    if (-not (Test-Path $scriptPath)) {
        Write-Host "❌ 脚本不存在: $ScriptName" -ForegroundColor Red
        return $false
    }
    
    try {
        Write-Host "🚀 执行: $ScriptName" -ForegroundColor Green
        if ($ScriptArguments.Count -gt 0) {
            & $scriptPath @ScriptArguments
        } else {
            & $scriptPath
        }
        return $true
    } catch {
        Write-Host "❌ 执行失败: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Show-Status {
    Write-Host "📊 仓库状态概览" -ForegroundColor Yellow
    Write-Host "===============================================" -ForegroundColor Gray
    
    # Git 状态
    try {
        Write-Host "📚 Git 状态:" -ForegroundColor Cyan
        $gitStatus = git status --porcelain
        if ($gitStatus) {
            Write-Host "   📝 有未提交的更改" -ForegroundColor Yellow
            git status --short
        } else {
            Write-Host "   ✅ 工作目录干净" -ForegroundColor Green
        }
        
        # 分支信息
        $currentBranch = git branch --show-current
        Write-Host "   🌿 当前分支: $currentBranch" -ForegroundColor Gray
        
        # 最近提交
        $lastCommit = git log -1 --pretty=format:"%h - %s (%cr)"
        Write-Host "   📝 最近提交: $lastCommit" -ForegroundColor Gray
        
    } catch {
        Write-Host "   ❌ 无法获取 Git 状态" -ForegroundColor Red
    }
    
    # 仓库大小
    try {
        Write-Host "`n💾 仓库大小:" -ForegroundColor Cyan
        $totalSize = (Get-ChildItem -Recurse -File | Measure-Object -Property Length -Sum).Sum
        $totalSizeMB = [math]::Round($totalSize / 1MB, 2)
        Write-Host "   📦 总大小: $totalSizeMB MB" -ForegroundColor Gray
        
        $gitSize = (Get-ChildItem -Path ".git" -Recurse -File | Measure-Object -Property Length -Sum).Sum
        $gitSizeMB = [math]::Round($gitSize / 1MB, 2)
        Write-Host "   📚 Git 历史: $gitSizeMB MB" -ForegroundColor Gray
        
    } catch {
        Write-Host "   ❌ 无法计算仓库大小" -ForegroundColor Red
    }
    
    # 文件统计
    try {
        Write-Host "`n📄 文件统计:" -ForegroundColor Cyan
        $fileCount = (Get-ChildItem -Recurse -File | Where-Object { $_.FullName -notlike "*\.git\*" }).Count
        Write-Host "   📊 总文件数: $fileCount" -ForegroundColor Gray
        
        # 按类型统计
        $extensions = Get-ChildItem -Recurse -File | 
                     Where-Object { $_.FullName -notlike "*\.git\*" } |
                     Group-Object Extension |
                     Sort-Object Count -Descending |
                     Select-Object -First 5
        
        foreach ($ext in $extensions) {
            $extName = if ($ext.Name) { $ext.Name } else { "(无扩展名)" }
            Write-Host "   📄 $extName : $($ext.Count) 个" -ForegroundColor Gray
        }
        
    } catch {
        Write-Host "   ❌ 无法统计文件" -ForegroundColor Red
    }
    
    # 可用脚本
    Write-Host "`n🛠️ 可用工具:" -ForegroundColor Cyan
    $scripts = @("health-check.ps1", "deploy.ps1", "optimize-repo.ps1", "update-readme.ps1")
    foreach ($script in $scripts) {
        $exists = Test-ScriptExists $script
        $status = if ($exists) { "✅" } else { "❌" }
        $scriptName = $script -replace "\.ps1$", ""
        Write-Host "   $status $scriptName" -ForegroundColor Gray
    }
}

function Show-Preview {
    Write-Host "🌐 生成本地预览..." -ForegroundColor Yellow
    
    # 检查是否存在 preview.html
    if (Test-Path "preview.html") {
        Write-Host "✅ 发现预览文件: preview.html" -ForegroundColor Green
        
        # 尝试在默认浏览器中打开
        try {
            Start-Process "preview.html"
            Write-Host "🚀 已在浏览器中打开预览" -ForegroundColor Green
        } catch {
            Write-Host "⚠️  无法自动打开浏览器，请手动打开 preview.html" -ForegroundColor Yellow
        }
    } else {
        Write-Host "❌ 未找到预览文件" -ForegroundColor Red
        Write-Host "💡 请先运行美化脚本生成预览文件" -ForegroundColor Cyan
    }
    
    # 显示相关链接
    Write-Host "`n🔗 相关链接:" -ForegroundColor Cyan
    Write-Host "   👤 GitHub 主页: https://github.com/Asakushen" -ForegroundColor Gray
    Write-Host "   🌐 个人博客: https://www.chillg.de" -ForegroundColor Gray
}

function Clean-Repository {
    Write-Host "🧹 清理仓库..." -ForegroundColor Yellow
    
    $tempPatterns = @(
        "*.tmp", "*.temp", "*~", "*.bak", "*.swp", "*.swo",
        "Thumbs.db", ".DS_Store", "desktop.ini"
    )
    
    $cleanedCount = 0
    foreach ($pattern in $tempPatterns) {
        $files = Get-ChildItem -Recurse -Force -Include $pattern -ErrorAction SilentlyContinue
        foreach ($file in $files) {
            if ($file.FullName -notlike "*\.git\*") {
                try {
                    Remove-Item $file.FullName -Force
                    $cleanedCount++
                    Write-Host "   🗑️  删除: $($file.Name)" -ForegroundColor Gray
                } catch {
                    Write-Host "   ❌ 无法删除: $($file.Name)" -ForegroundColor Red
                }
            }
        }
    }
    
    if ($cleanedCount -gt 0) {
        Write-Host "✅ 清理了 $cleanedCount 个临时文件" -ForegroundColor Green
    } else {
        Write-Host "✅ 没有找到需要清理的文件" -ForegroundColor Green
    }
}

# =============================================================================
# 🎯 主逻辑
# =============================================================================

switch ($Action.ToLower()) {
    "help" {
        Show-Help
    }
    
    "health" {
        if (Test-ScriptExists "health-check.ps1") {
            Invoke-Script "health-check.ps1" $Arguments
        } else {
            Write-Host "❌ 健康检查脚本不存在" -ForegroundColor Red
        }
    }
    
    "deploy" {
        if (Test-ScriptExists "deploy.ps1") {
            Invoke-Script "deploy.ps1" $Arguments
        } else {
            Write-Host "❌ 部署脚本不存在" -ForegroundColor Red
        }
    }
    
    "optimize" {
        if (Test-ScriptExists "optimize-repo.ps1") {
            Invoke-Script "optimize-repo.ps1" $Arguments
        } else {
            Write-Host "❌ 优化脚本不存在" -ForegroundColor Red
        }
    }
    
    "update" {
        if (Test-ScriptExists "update-readme.ps1") {
            Invoke-Script "update-readme.ps1" $Arguments
        } else {
            Write-Host "❌ 更新脚本不存在" -ForegroundColor Red
        }
    }
    
    "preview" {
        Show-Preview
    }
    
    "status" {
        Show-Status
    }
    
    "clean" {
        Clean-Repository
    }
    
    default {
        Write-Host "❌ 未知命令: $Action" -ForegroundColor Red
        Write-Host "💡 使用 'help' 查看可用命令" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "===============================================" -ForegroundColor Gray
Write-Host "🎯 管理工具执行完成" -ForegroundColor Green