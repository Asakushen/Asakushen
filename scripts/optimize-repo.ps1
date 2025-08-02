# 🔧 仓库优化脚本
# 用于优化 Asakushen 个人主页仓库的大小和性能

param(
    [switch]$DryRun = $false,
    [switch]$Aggressive = $false,
    [switch]$CleanHistory = $false
)

Write-Host "🔧 仓库优化工具" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray

if ($DryRun) {
    Write-Host "🔍 运行模式: 预览模式 (不会实际执行更改)" -ForegroundColor Yellow
} else {
    Write-Host "⚡ 运行模式: 执行模式" -ForegroundColor Green
}

# =============================================================================
# 📊 当前状态分析
# =============================================================================

Write-Host "`n📊 分析当前仓库状态..." -ForegroundColor Yellow

function Get-DirectorySize {
    param([string]$Path)
    try {
        $size = (Get-ChildItem -Path $Path -Recurse -File | Measure-Object -Property Length -Sum).Sum
        return [math]::Round($size / 1MB, 2)
    } catch {
        return 0
    }
}

function Get-GitRepoSize {
    try {
        $gitSize = (Get-ChildItem -Path ".git" -Recurse -File | Measure-Object -Property Length -Sum).Sum
        return [math]::Round($gitSize / 1MB, 2)
    } catch {
        return 0
    }
}

$totalSize = Get-DirectorySize "."
$gitSize = Get-GitRepoSize
$workingSize = $totalSize - $gitSize

Write-Host "📦 仓库总大小: $totalSize MB" -ForegroundColor Cyan
Write-Host "🗂️  工作目录: $workingSize MB" -ForegroundColor Cyan
Write-Host "📚 Git 历史: $gitSize MB" -ForegroundColor Cyan

# =============================================================================
# 🔍 查找大文件
# =============================================================================

Write-Host "`n🔍 查找大文件 (>1MB)..." -ForegroundColor Yellow

$largeFiles = Get-ChildItem -Recurse -File | Where-Object { 
    $_.Length -gt 1MB -and $_.FullName -notlike "*\.git\*" 
} | Sort-Object Length -Descending

if ($largeFiles) {
    Write-Host "📄 发现大文件:" -ForegroundColor Red
    foreach ($file in $largeFiles) {
        $sizeMB = [math]::Round($file.Length / 1MB, 2)
        $relativePath = $file.FullName.Replace((Get-Location).Path + "\", "")
        Write-Host "   💾 $relativePath : $sizeMB MB" -ForegroundColor Yellow
    }
} else {
    Write-Host "✅ 未发现大文件" -ForegroundColor Green
}

# =============================================================================
# 🧹 清理临时文件
# =============================================================================

Write-Host "`n🧹 清理临时文件..." -ForegroundColor Yellow

$tempPatterns = @(
    "*.tmp", "*.temp", "*~", "*.bak", "*.swp", "*.swo",
    "Thumbs.db", ".DS_Store", "desktop.ini",
    "*.log", "*.cache", "node_modules", "__pycache__"
)

$cleanedFiles = @()
$savedSpace = 0

foreach ($pattern in $tempPatterns) {
    $files = Get-ChildItem -Recurse -Force -Include $pattern -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        if ($file.FullName -notlike "*\.git\*") {
            $savedSpace += $file.Length
            $cleanedFiles += $file.FullName
            
            if (-not $DryRun) {
                Remove-Item $file.FullName -Force -Recurse -ErrorAction SilentlyContinue
            }
        }
    }
}

if ($cleanedFiles.Count -gt 0) {
    $savedMB = [math]::Round($savedSpace / 1MB, 2)
    Write-Host "🗑️  清理了 $($cleanedFiles.Count) 个临时文件，节省 $savedMB MB" -ForegroundColor Green
    
    if ($DryRun) {
        Write-Host "📋 将要删除的文件:" -ForegroundColor Cyan
        $cleanedFiles | ForEach-Object { Write-Host "   🗑️  $_" -ForegroundColor Gray }
    }
} else {
    Write-Host "✅ 没有找到临时文件" -ForegroundColor Green
}

# =============================================================================
# 🎯 Git 优化
# =============================================================================

Write-Host "`n🎯 Git 仓库优化..." -ForegroundColor Yellow

if (-not $DryRun) {
    try {
        Write-Host "🔄 运行 git gc..." -ForegroundColor Cyan
        git gc --aggressive --prune=now
        
        Write-Host "🧹 清理 reflog..." -ForegroundColor Cyan
        git reflog expire --expire=now --all
        
        Write-Host "📦 重新打包对象..." -ForegroundColor Cyan
        git repack -ad
        
        Write-Host "✅ Git 优化完成" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Git 优化过程中出现警告" -ForegroundColor Yellow
    }
} else {
    Write-Host "🔍 预览: 将执行 git gc, reflog expire, repack" -ForegroundColor Cyan
}

# =============================================================================
# 📈 Git 历史分析
# =============================================================================

Write-Host "`n📈 分析 Git 历史..." -ForegroundColor Yellow

try {
    # 统计提交数量
    $totalCommits = (git rev-list --all --count)
    Write-Host "📊 总提交数: $totalCommits" -ForegroundColor Cyan
    
    # 查找最大的 blob 对象
    Write-Host "🔍 查找历史中的大文件..." -ForegroundColor Cyan
    
    $largeBlobs = git rev-list --objects --all | 
        git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
        Where-Object { $_ -match '^blob' } |
        ForEach-Object {
            $parts = $_ -split '\s+', 4
            [PSCustomObject]@{
                Type = $parts[0]
                Hash = $parts[1]
                Size = [int]$parts[2]
                Path = if ($parts.Length -gt 3) { $parts[3] } else { "unknown" }
            }
        } |
        Where-Object { $_.Size -gt 1MB } |
        Sort-Object Size -Descending |
        Select-Object -First 10
    
    if ($largeBlobs) {
        Write-Host "📄 Git 历史中的大文件:" -ForegroundColor Red
        foreach ($blob in $largeBlobs) {
            $sizeMB = [math]::Round($blob.Size / 1MB, 2)
            Write-Host "   💾 $($blob.Path): $sizeMB MB" -ForegroundColor Yellow
        }
    }
    
} catch {
    Write-Host "⚠️  无法分析 Git 历史" -ForegroundColor Yellow
}

# =============================================================================
# 🚨 高级清理选项
# =============================================================================

if ($Aggressive) {
    Write-Host "`n🚨 高级清理模式..." -ForegroundColor Red
    
    # 清理未跟踪的文件
    if (-not $DryRun) {
        Write-Host "🧹 清理未跟踪的文件..." -ForegroundColor Yellow
        git clean -fd
    } else {
        Write-Host "🔍 预览: 将清理未跟踪的文件" -ForegroundColor Cyan
        git clean -fdn
    }
}

if ($CleanHistory) {
    Write-Host "`n⚠️  历史清理模式 (危险操作)..." -ForegroundColor Red
    Write-Host "这将永久删除 Git 历史中的大文件!" -ForegroundColor Red
    
    if (-not $DryRun) {
        $confirm = Read-Host "确定要继续吗? 这是不可逆的操作! (yes/no)"
        if ($confirm -eq "yes") {
            Write-Host "🔧 使用 BFG Repo-Cleaner 清理历史..." -ForegroundColor Yellow
            Write-Host "💡 请手动下载并运行 BFG Repo-Cleaner:" -ForegroundColor Cyan
            Write-Host "   java -jar bfg.jar --strip-blobs-bigger-than 5M ." -ForegroundColor Gray
            Write-Host "   git reflog expire --expire=now --all && git gc --prune=now --aggressive" -ForegroundColor Gray
        }
    } else {
        Write-Host "🔍 预览: 将使用 BFG 清理大于 5MB 的历史文件" -ForegroundColor Cyan
    }
}

# =============================================================================
# 📊 优化后状态
# =============================================================================

Write-Host "`n📊 优化后状态..." -ForegroundColor Yellow

$newTotalSize = Get-DirectorySize "."
$newGitSize = Get-GitRepoSize
$newWorkingSize = $newTotalSize - $newGitSize

Write-Host "📦 优化后总大小: $newTotalSize MB" -ForegroundColor Cyan
Write-Host "🗂️  工作目录: $newWorkingSize MB" -ForegroundColor Cyan
Write-Host "📚 Git 历史: $newGitSize MB" -ForegroundColor Cyan

$savedTotal = $totalSize - $newTotalSize
if ($savedTotal -gt 0) {
    Write-Host "💾 节省空间: $savedTotal MB" -ForegroundColor Green
} else {
    Write-Host "📊 大小变化: $savedTotal MB" -ForegroundColor Yellow
}

# =============================================================================
# 💡 建议
# =============================================================================

Write-Host "`n💡 优化建议:" -ForegroundColor Yellow

if ($largeFiles.Count -gt 0) {
    Write-Host "1. 🎯 考虑压缩或删除大文件" -ForegroundColor Cyan
    Write-Host "2. 📦 对于必要的大文件，使用 Git LFS" -ForegroundColor Cyan
}

Write-Host "3. 🔄 定期运行此优化脚本" -ForegroundColor Cyan
Write-Host "4. 📊 监控仓库大小变化" -ForegroundColor Cyan
Write-Host "5. 🚫 避免提交生成的文件" -ForegroundColor Cyan

Write-Host "`n🎯 优化完成!" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray

Write-Host "`n💡 使用参数:" -ForegroundColor Yellow
Write-Host "   -DryRun (预览模式，不执行实际更改)" -ForegroundColor Cyan
Write-Host "   -Aggressive (激进清理模式)" -ForegroundColor Cyan
Write-Host "   -CleanHistory (清理 Git 历史，危险操作)" -ForegroundColor Cyan