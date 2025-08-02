# Repository Management Script
param(
    [Parameter(Position=0)]
    [string]$Action = "help"
)

function Show-Help {
    Write-Host "Repository Management Tool" -ForegroundColor Green
    Write-Host "=========================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Usage: .\manage.ps1 [action]" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Available actions:" -ForegroundColor Cyan
    Write-Host "  help      - Show this help message" -ForegroundColor White
    Write-Host "  health    - Run repository health check" -ForegroundColor White
    Write-Host "  deploy    - Deploy the repository" -ForegroundColor White
    Write-Host "  optimize  - Optimize repository" -ForegroundColor White
    Write-Host "  update    - Update README.md" -ForegroundColor White
    Write-Host "  preview   - Preview repository status" -ForegroundColor White
    Write-Host "  status    - Show detailed status" -ForegroundColor White
    Write-Host "  clean     - Clean repository" -ForegroundColor White
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor Cyan
    Write-Host "  .\manage.ps1 health" -ForegroundColor Gray
    Write-Host "  .\manage.ps1 deploy" -ForegroundColor Gray
    Write-Host "  .\manage.ps1 optimize" -ForegroundColor Gray
}

function Test-ScriptExists {
    param([string]$ScriptName)
    $scriptPath = Join-Path $PSScriptRoot $ScriptName
    return Test-Path $scriptPath
}

function Invoke-Script {
    param([string]$ScriptName)
    $scriptPath = Join-Path $PSScriptRoot $ScriptName
    
    if (Test-Path $scriptPath) {
        Write-Host "Running $ScriptName..." -ForegroundColor Green
        try {
            & $scriptPath
            Write-Host "Script completed successfully" -ForegroundColor Green
        }
        catch {
            Write-Host "Script failed: $($_.Exception.Message)" -ForegroundColor Red
        }
    } else {
        Write-Host "Script not found: $scriptPath" -ForegroundColor Red
    }
}

function Show-Status {
    Write-Host "Repository Status" -ForegroundColor Green
    Write-Host "=================" -ForegroundColor Green
    Write-Host ""
    
    # Repository size
    Write-Host "Repository Size:" -ForegroundColor Yellow
    $repoSize = (Get-ChildItem -Recurse | Measure-Object -Property Length -Sum).Sum
    $repoSizeMB = [math]::Round($repoSize / 1MB, 2)
    Write-Host "  Total size: $repoSizeMB MB" -ForegroundColor Cyan
    
    # File statistics
    Write-Host "`nFile Statistics:" -ForegroundColor Yellow
    $totalFiles = (Get-ChildItem -Recurse -File).Count
    $totalDirs = (Get-ChildItem -Recurse -Directory).Count
    Write-Host "  Files: $totalFiles" -ForegroundColor Cyan
    Write-Host "  Directories: $totalDirs" -ForegroundColor Cyan
    
    # Available tools
    Write-Host "`nAvailable Tools:" -ForegroundColor Yellow
    $scripts = @("health-check.ps1", "deploy.ps1", "optimize-repo.ps1", "update-readme.ps1")
    foreach ($script in $scripts) {
        if (Test-ScriptExists $script) {
            Write-Host "  [OK] $script" -ForegroundColor Green
        } else {
            Write-Host "  [NO] $script" -ForegroundColor Red
        }
    }
    
    # Git status
    Write-Host "`nGit Status:" -ForegroundColor Yellow
    try {
        $gitStatus = git status --porcelain
        if ($gitStatus) {
            Write-Host "  Changes detected" -ForegroundColor Yellow
        } else {
            Write-Host "  Working directory clean" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "  Git not available" -ForegroundColor Red
    }
}

function Show-Preview {
    Write-Host "Repository Preview" -ForegroundColor Green
    Write-Host "==================" -ForegroundColor Green
    Write-Host ""
    
    # Show directory structure
    Write-Host "Directory Structure:" -ForegroundColor Yellow
    Get-ChildItem -Directory | ForEach-Object {
        Write-Host "  $($_.Name)/" -ForegroundColor Cyan
    }
    
    # Show key files
    Write-Host "`nKey Files:" -ForegroundColor Yellow
    $keyFiles = @("README.md", "LICENSE", ".gitignore", "package.json", "requirements.txt")
    foreach ($file in $keyFiles) {
        if (Test-Path $file) {
            Write-Host "  [OK] $file" -ForegroundColor Green
        }
    }
    
    # Show recent commits
    Write-Host "`nRecent Commits:" -ForegroundColor Yellow
    try {
        git log --oneline -5 | ForEach-Object {
            Write-Host "  $_" -ForegroundColor Gray
        }
    }
    catch {
        Write-Host "  Git not available" -ForegroundColor Red
    }
}

function Clean-Repository {
    Write-Host "Cleaning Repository" -ForegroundColor Green
    Write-Host "===================" -ForegroundColor Green
    Write-Host ""
    
    # Clean temporary files
    Write-Host "Cleaning temporary files..." -ForegroundColor Yellow
    $tempPatterns = @("*.tmp", "*.temp", "*.log", "*.cache")
    $cleaned = 0
    
    foreach ($pattern in $tempPatterns) {
        $files = Get-ChildItem -Recurse -File -Name $pattern -ErrorAction SilentlyContinue
        if ($files) {
            $files | ForEach-Object {
                Remove-Item $_ -Force
                $cleaned++
            }
        }
    }
    
    if ($cleaned -gt 0) {
        Write-Host "Cleaned $cleaned temporary files" -ForegroundColor Green
    } else {
        Write-Host "No temporary files found" -ForegroundColor Green
    }
    
    # Clean empty directories
    Write-Host "`nCleaning empty directories..." -ForegroundColor Yellow
    $emptyDirs = Get-ChildItem -Recurse -Directory | Where-Object { (Get-ChildItem $_.FullName).Count -eq 0 }
    if ($emptyDirs) {
        $emptyDirs | Remove-Item -Force
        Write-Host "Removed $($emptyDirs.Count) empty directories" -ForegroundColor Green
    } else {
        Write-Host "No empty directories found" -ForegroundColor Green
    }
}

# Main script logic
switch ($Action.ToLower()) {
    "help" {
        Show-Help
    }
    "health" {
        if (Test-ScriptExists "health-check.ps1") {
            Invoke-Script "health-check.ps1"
        } else {
            Write-Host "health-check.ps1 not found" -ForegroundColor Red
        }
    }
    "deploy" {
        if (Test-ScriptExists "deploy.ps1") {
            Invoke-Script "deploy.ps1"
        } else {
            Write-Host "deploy.ps1 not found" -ForegroundColor Red
        }
    }
    "optimize" {
        if (Test-ScriptExists "optimize-repo.ps1") {
            Invoke-Script "optimize-repo.ps1"
        } else {
            Write-Host "optimize-repo.ps1 not found" -ForegroundColor Red
        }
    }
    "update" {
        if (Test-ScriptExists "update-readme.ps1") {
            Invoke-Script "update-readme.ps1"
        } else {
            Write-Host "update-readme.ps1 not found" -ForegroundColor Red
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
        Write-Host "Unknown action: $Action" -ForegroundColor Red
        Write-Host "Use 'help' to see available actions" -ForegroundColor Yellow
        Show-Help
    }
}

Write-Host "`nManagement script completed!" -ForegroundColor Green