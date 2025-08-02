# Simple Repository Health Check
Write-Host "Starting repository health check..." -ForegroundColor Green

# Check repository size
Write-Host "`nChecking repository size..." -ForegroundColor Yellow
$repoSize = (Get-ChildItem -Recurse | Measure-Object -Property Length -Sum).Sum
$repoSizeMB = [math]::Round($repoSize / 1MB, 2)
Write-Host "Total repository size: $repoSizeMB MB" -ForegroundColor Cyan

# Check large files
Write-Host "`nChecking for large files (>5MB)..." -ForegroundColor Yellow
$largeFiles = Get-ChildItem -Recurse | Where-Object { $_.Length -gt 5MB }
if ($largeFiles.Count -gt 0) {
    Write-Host "Found $($largeFiles.Count) large files" -ForegroundColor Red
} else {
    Write-Host "No large files found" -ForegroundColor Green
}

# Check critical files
Write-Host "`nChecking critical files..." -ForegroundColor Yellow
$criticalFiles = @("README.md", "LICENSE", ".gitignore")
foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        Write-Host "[OK] $file" -ForegroundColor Green
    } else {
        Write-Host "[NO] $file" -ForegroundColor Red
    }
}

# Check SVG files
Write-Host "`nChecking SVG files..." -ForegroundColor Yellow
$svgFiles = Get-ChildItem -Path "assets" -Filter "*.svg" -ErrorAction SilentlyContinue
if ($svgFiles) {
    Write-Host "Found $($svgFiles.Count) SVG files" -ForegroundColor Green
} else {
    Write-Host "No SVG files found" -ForegroundColor Yellow
}

Write-Host "`nHealth check completed!" -ForegroundColor Green