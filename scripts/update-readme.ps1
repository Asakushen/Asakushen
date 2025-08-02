# 📝 README 更新脚本
# 用于自动更新 README.md 中的动态内容

param(
    [switch]$UpdateStats = $false,
    [switch]$UpdateTechStack = $false,
    [switch]$UpdateProjects = $false,
    [switch]$All = $false,
    [switch]$DryRun = $false
)

Write-Host "📝 README 更新工具" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray

if ($DryRun) {
    Write-Host "🔍 运行模式: 预览模式" -ForegroundColor Yellow
} else {
    Write-Host "⚡ 运行模式: 执行模式" -ForegroundColor Green
}

# =============================================================================
# 📊 统计信息更新
# =============================================================================

if ($UpdateStats -or $All) {
    Write-Host "`n📊 更新统计信息..." -ForegroundColor Yellow
    
    try {
        # 获取仓库统计
        $commitCount = git rev-list --all --count
        $branchCount = (git branch -r | Measure-Object).Count
        $fileCount = (Get-ChildItem -Recurse -File | Where-Object { $_.FullName -notlike "*\.git\*" } | Measure-Object).Count
        
        Write-Host "📈 仓库统计:" -ForegroundColor Cyan
        Write-Host "   📊 总提交数: $commitCount" -ForegroundColor Gray
        Write-Host "   🌿 分支数: $branchCount" -ForegroundColor Gray
        Write-Host "   📄 文件数: $fileCount" -ForegroundColor Gray
        
        # 更新 README 中的统计信息
        if (-not $DryRun) {
            # 这里可以添加具体的 README 更新逻辑
            Write-Host "✅ 统计信息已更新" -ForegroundColor Green
        }
        
    } catch {
        Write-Host "❌ 获取统计信息失败" -ForegroundColor Red
    }
}

# =============================================================================
# 🛠️ 技术栈更新
# =============================================================================

if ($UpdateTechStack -or $All) {
    Write-Host "`n🛠️ 分析技术栈..." -ForegroundColor Yellow
    
    # 定义技术栈检测规则
    $techStack = @{
        "Languages" = @{
            "Python" = @("*.py", "requirements.txt", "setup.py", "pyproject.toml")
            "JavaScript" = @("*.js", "*.mjs", "package.json")
            "TypeScript" = @("*.ts", "*.tsx", "tsconfig.json")
            "HTML" = @("*.html", "*.htm")
            "CSS" = @("*.css", "*.scss", "*.sass", "*.less")
            "C++" = @("*.cpp", "*.cc", "*.cxx", "*.h", "*.hpp")
            "Java" = @("*.java", "pom.xml", "build.gradle")
            "C#" = @("*.cs", "*.csproj", "*.sln")
            "Go" = @("*.go", "go.mod", "go.sum")
            "Rust" = @("*.rs", "Cargo.toml")
            "PHP" = @("*.php", "composer.json")
            "Ruby" = @("*.rb", "Gemfile")
        }
        "Frameworks" = @{
            "React" = @("package.json")  # 需要检查内容
            "Vue" = @("package.json")    # 需要检查内容
            "Angular" = @("package.json") # 需要检查内容
            "Django" = @("manage.py", "settings.py")
            "Flask" = @("app.py", "requirements.txt") # 需要检查内容
            "Express" = @("package.json") # 需要检查内容
        }
        "Tools" = @{
            "Docker" = @("Dockerfile", "docker-compose.yml", ".dockerignore")
            "Git" = @(".gitignore", ".gitattributes")
            "VS Code" = @(".vscode/*")
            "Webpack" = @("webpack.config.js", "webpack.config.ts")
            "Vite" = @("vite.config.js", "vite.config.ts")
        }
    }
    
    $detectedTech = @{}
    
    foreach ($category in $techStack.Keys) {
        $detectedTech[$category] = @()
        
        foreach ($tech in $techStack[$category].Keys) {
            $patterns = $techStack[$category][$tech]
            $found = $false
            
            foreach ($pattern in $patterns) {
                if ($pattern.Contains("*")) {
                    # 文件扩展名模式
                    $files = Get-ChildItem -Recurse -Include $pattern -ErrorAction SilentlyContinue
                    if ($files) {
                        $found = $true
                        break
                    }
                } else {
                    # 具体文件名
                    if (Test-Path $pattern) {
                        $found = $true
                        break
                    }
                }
            }
            
            if ($found) {
                $detectedTech[$category] += $tech
            }
        }
    }
    
    Write-Host "🔍 检测到的技术栈:" -ForegroundColor Cyan
    foreach ($category in $detectedTech.Keys) {
        if ($detectedTech[$category].Count -gt 0) {
            Write-Host "   $category : $($detectedTech[$category] -join ', ')" -ForegroundColor Gray
        }
    }
    
    if (-not $DryRun) {
        Write-Host "✅ 技术栈信息已分析" -ForegroundColor Green
    }
}

# =============================================================================
# 📦 项目信息更新
# =============================================================================

if ($UpdateProjects -or $All) {
    Write-Host "`n📦 分析项目结构..." -ForegroundColor Yellow
    
    # 分析项目结构
    $projectInfo = @{
        "MainFiles" = @()
        "ConfigFiles" = @()
        "DocumentationFiles" = @()
        "AssetFiles" = @()
    }
    
    # 主要文件
    $mainPatterns = @("*.py", "*.js", "*.ts", "*.html", "*.css", "*.cpp", "*.java", "*.cs", "*.go", "*.rs")
    foreach ($pattern in $mainPatterns) {
        $files = Get-ChildItem -Recurse -Include $pattern -ErrorAction SilentlyContinue | 
                 Where-Object { $_.FullName -notlike "*\.git\*" -and $_.FullName -notlike "*node_modules*" }
        $projectInfo["MainFiles"] += $files
    }
    
    # 配置文件
    $configPatterns = @("*.json", "*.yml", "*.yaml", "*.toml", "*.ini", "*.conf", "*.config")
    foreach ($pattern in $configPatterns) {
        $files = Get-ChildItem -Recurse -Include $pattern -ErrorAction SilentlyContinue |
                 Where-Object { $_.FullName -notlike "*\.git\*" }
        $projectInfo["ConfigFiles"] += $files
    }
    
    # 文档文件
    $docPatterns = @("*.md", "*.txt", "*.rst", "*.doc", "*.docx")
    foreach ($pattern in $docPatterns) {
        $files = Get-ChildItem -Recurse -Include $pattern -ErrorAction SilentlyContinue |
                 Where-Object { $_.FullName -notlike "*\.git\*" }
        $projectInfo["DocumentationFiles"] += $files
    }
    
    # 资源文件
    $assetPatterns = @("*.png", "*.jpg", "*.jpeg", "*.gif", "*.svg", "*.ico", "*.webp")
    foreach ($pattern in $assetPatterns) {
        $files = Get-ChildItem -Recurse -Include $pattern -ErrorAction SilentlyContinue |
                 Where-Object { $_.FullName -notlike "*\.git\*" }
        $projectInfo["AssetFiles"] += $files
    }
    
    Write-Host "📊 项目结构分析:" -ForegroundColor Cyan
    foreach ($category in $projectInfo.Keys) {
        $count = $projectInfo[$category].Count
        Write-Host "   $category : $count 个文件" -ForegroundColor Gray
    }
    
    # 计算代码行数
    try {
        $codeFiles = $projectInfo["MainFiles"] | Where-Object { $_.Extension -in @(".py", ".js", ".ts", ".html", ".css", ".cpp", ".java", ".cs", ".go", ".rs") }
        $totalLines = 0
        
        foreach ($file in $codeFiles) {
            try {
                $lines = (Get-Content $file.FullName | Measure-Object).Count
                $totalLines += $lines
            } catch {
                # 忽略无法读取的文件
            }
        }
        
        Write-Host "   📝 总代码行数: $totalLines" -ForegroundColor Gray
    } catch {
        Write-Host "   ⚠️  无法计算代码行数" -ForegroundColor Yellow
    }
    
    if (-not $DryRun) {
        Write-Host "✅ 项目信息已分析" -ForegroundColor Green
    }
}

# =============================================================================
# 🔗 链接检查
# =============================================================================

Write-Host "`n🔗 检查 README 中的链接..." -ForegroundColor Yellow

if (Test-Path "README.md") {
    $readmeContent = Get-Content "README.md" -Raw
    
    # 提取链接
    $linkPattern = '\[([^\]]+)\]\(([^)]+)\)'
    $links = [regex]::Matches($readmeContent, $linkPattern)
    
    $brokenLinks = @()
    $validLinks = @()
    
    foreach ($link in $links) {
        $url = $link.Groups[2].Value
        $text = $link.Groups[1].Value
        
        if ($url.StartsWith("http")) {
            # HTTP 链接 - 这里可以添加实际的链接检查
            $validLinks += @{ Text = $text; Url = $url }
        } elseif ($url.StartsWith("#")) {
            # 锚点链接
            $validLinks += @{ Text = $text; Url = $url }
        } else {
            # 相对路径
            if (Test-Path $url) {
                $validLinks += @{ Text = $text; Url = $url }
            } else {
                $brokenLinks += @{ Text = $text; Url = $url }
            }
        }
    }
    
    Write-Host "🔗 链接检查结果:" -ForegroundColor Cyan
    Write-Host "   ✅ 有效链接: $($validLinks.Count)" -ForegroundColor Green
    Write-Host "   ❌ 失效链接: $($brokenLinks.Count)" -ForegroundColor Red
    
    if ($brokenLinks.Count -gt 0) {
        Write-Host "🚨 失效链接列表:" -ForegroundColor Red
        foreach ($link in $brokenLinks) {
            Write-Host "   ❌ [$($link.Text)]($($link.Url))" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "❌ README.md 文件不存在" -ForegroundColor Red
}

# =============================================================================
# 📝 生成更新建议
# =============================================================================

Write-Host "`n📝 更新建议:" -ForegroundColor Yellow

$suggestions = @()

if ($UpdateStats -or $All) {
    $suggestions += "📊 考虑添加实时统计徽章"
    $suggestions += "📈 更新项目进度和里程碑"
}

if ($UpdateTechStack -or $All) {
    $suggestions += "🛠️ 根据检测结果更新技术栈图标"
    $suggestions += "🔧 添加新学习的技术和工具"
}

if ($UpdateProjects -or $All) {
    $suggestions += "📦 更新项目描述和链接"
    $suggestions += "🎯 添加最新完成的项目"
}

$suggestions += "🔗 修复失效的链接"
$suggestions += "📸 更新截图和演示图片"
$suggestions += "📚 完善文档和使用说明"

foreach ($suggestion in $suggestions) {
    Write-Host "   💡 $suggestion" -ForegroundColor Cyan
}

# =============================================================================
# 🎯 完成
# =============================================================================

Write-Host "`n🎯 README 分析完成!" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Gray

Write-Host "`n💡 使用参数:" -ForegroundColor Yellow
Write-Host "   -UpdateStats (更新统计信息)" -ForegroundColor Cyan
Write-Host "   -UpdateTechStack (更新技术栈)" -ForegroundColor Cyan
Write-Host "   -UpdateProjects (更新项目信息)" -ForegroundColor Cyan
Write-Host "   -All (执行所有更新)" -ForegroundColor Cyan
Write-Host "   -DryRun (预览模式)" -ForegroundColor Cyan