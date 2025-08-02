# Repository Health Check Script
Write-Host "Repository Health Check" -ForegroundColor Green
Write-Host "=======================" -ForegroundColor Green
Write-Host ""

# Check repository size
Write-Host "1. Repository Size Check" -ForegroundColor Yellow
$repoSize = (Get-ChildItem -Recurse | Measure-Object -Property Length -Sum).Sum
$repoSizeMB = [math]::Round($repoSize / 1MB, 2)
Write-Host "   Total size: $repoSizeMB MB" -ForegroundColor Cyan

if ($repoSizeMB -gt 100) {
    Write-Host "   [WARNING] Repository is quite large" -ForegroundColor Yellow
} else {
    Write-Host "   [OK] Repository size is reasonable" -ForegroundColor Green
}

# Check for large files
Write-Host "`n2. Large Files Check (>5MB)" -ForegroundColor Yellow
$largeFiles = Get-ChildItem -Recurse | Where-Object { $_.Length -gt 5MB }
if ($largeFiles.Count -gt 0) {
    Write-Host "   [WARNING] Found $($largeFiles.Count) large files:" -ForegroundColor Yellow
    foreach ($file in $largeFiles) {
        $sizeMB = [math]::Round($file.Length / 1MB, 2)
        Write-Host "     - $($file.Name): $sizeMB MB" -ForegroundColor Gray
    }
} else {
    Write-Host "   [OK] No large files found" -ForegroundColor Green
}

# Check Git status
Write-Host "`n3. Git Status Check" -ForegroundColor Yellow
try {
    $gitStatus = git status --porcelain
    if ($gitStatus) {
        Write-Host "   [INFO] Changes detected:" -ForegroundColor Cyan
        git status --short
    } else {
        Write-Host "   [OK] Working directory is clean" -ForegroundColor Green
    }
    
    # Check for untracked files
    $untrackedFiles = git ls-files --others --exclude-standard
    if ($untrackedFiles) {
        Write-Host "   [INFO] Untracked files found" -ForegroundColor Cyan
    }
} catch {
    Write-Host "   [ERROR] Git not available" -ForegroundColor Red
}

# Check commit history
Write-Host "`n4. Commit History Check" -ForegroundColor Yellow
try {
    $commitCount = (git rev-list --count HEAD)
    Write-Host "   Total commits: $commitCount" -ForegroundColor Cyan
    
    $lastCommit = git log -1 --pretty=format:"%h - %s (%cr)"
    Write-Host "   Last commit: $lastCommit" -ForegroundColor Gray
    
    if ($commitCount -lt 5) {
        Write-Host "   [INFO] Repository has few commits" -ForegroundColor Cyan
    } else {
        Write-Host "   [OK] Good commit history" -ForegroundColor Green
    }
} catch {
    Write-Host "   [ERROR] Cannot check commit history" -ForegroundColor Red
}

# Check critical files
Write-Host "`n5. Critical Files Check" -ForegroundColor Yellow
$criticalFiles = @("README.md", "LICENSE", ".gitignore")
foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        Write-Host "   [OK] $file exists" -ForegroundColor Green
    } else {
        Write-Host "   [WARNING] $file missing" -ForegroundColor Yellow
    }
}

# Check SVG files
Write-Host "`n6. SVG Files Check" -ForegroundColor Yellow
$svgFiles = Get-ChildItem -Path "assets" -Filter "*.svg" -ErrorAction SilentlyContinue
if ($svgFiles) {
    Write-Host "   [OK] Found $($svgFiles.Count) SVG files" -ForegroundColor Green
    foreach ($svg in $svgFiles) {
        Write-Host "     - $($svg.Name)" -ForegroundColor Gray
    }
} else {
    Write-Host "   [INFO] No SVG files found in assets/" -ForegroundColor Cyan
}

# Check README.md links
Write-Host "`n7. README.md Links Check" -ForegroundColor Yellow
if (Test-Path "README.md") {
    $readmeContent = Get-Content "README.md" -Raw
    $linkPattern = '\[([^\]]+)\]\(([^)]+)\)'
    $links = [regex]::Matches($readmeContent, $linkPattern)
    
    if ($links.Count -gt 0) {
        Write-Host "   [OK] Found $($links.Count) links in README.md" -ForegroundColor Green
    } else {
        Write-Host "   [INFO] No links found in README.md" -ForegroundColor Cyan
    }
} else {
    Write-Host "   [ERROR] README.md not found" -ForegroundColor Red
}

# Optimization suggestions
Write-Host "`n8. Optimization Suggestions" -ForegroundColor Yellow
$suggestions = @()

if ($repoSizeMB -gt 50) {
    $suggestions += "Consider optimizing repository size"
}

if ($largeFiles.Count -gt 0) {
    $suggestions += "Consider using Git LFS for large files"
}

$tempFiles = Get-ChildItem -Recurse -Include "*.tmp", "*.temp", "*.log" -ErrorAction SilentlyContinue
if ($tempFiles) {
    $suggestions += "Clean up temporary files"
}

if ($suggestions.Count -gt 0) {
    foreach ($suggestion in $suggestions) {
        Write-Host "   - $suggestion" -ForegroundColor Yellow
    }
} else {
    Write-Host "   [OK] No optimization needed" -ForegroundColor Green
}

# Summary
Write-Host "`n9. Health Check Summary" -ForegroundColor Green
Write-Host "   Repository size: $repoSizeMB MB" -ForegroundColor Cyan
Write-Host "   Large files: $($largeFiles.Count)" -ForegroundColor Cyan
Write-Host "   SVG files: $($svgFiles.Count)" -ForegroundColor Cyan
Write-Host "   Suggestions: $($suggestions.Count)" -ForegroundColor Cyan

Write-Host "`nHealth check completed!" -ForegroundColor Green