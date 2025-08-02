# 🛠️ Asakushen 个人主页管理工具

这个目录包含了用于维护和管理 Asakushen 个人主页仓库的 PowerShell 脚本工具集。

## 📋 工具概览

### 🎯 主管理脚本
- **`manage.ps1`** - 统一管理入口，提供所有功能的快捷访问

### 🔧 专用工具脚本
- **`health-check.ps1`** - 仓库健康检查工具
- **`deploy.ps1`** - 快速部署脚本
- **`optimize-repo.ps1`** - 仓库优化工具
- **`update-readme.ps1`** - README 更新工具

## 🚀 快速开始

### 使用主管理脚本（推荐）

```powershell
# 显示帮助信息
.\scripts\manage.ps1 help

# 运行健康检查
.\scripts\manage.ps1 health

# 快速部署
.\scripts\manage.ps1 deploy

# 优化仓库
.\scripts\manage.ps1 optimize

# 更新 README
.\scripts\manage.ps1 update

# 查看状态
.\scripts\manage.ps1 status

# 生成预览
.\scripts\manage.ps1 preview

# 清理临时文件
.\scripts\manage.ps1 clean
```

### 直接使用专用脚本

```powershell
# 健康检查
.\scripts\health-check.ps1

# 部署（带自定义消息）
.\scripts\deploy.ps1 -Message "🎨 更新个人主页设计"

# 优化（预览模式）
.\scripts\optimize-repo.ps1 -DryRun

# 更新 README（所有内容）
.\scripts\update-readme.ps1 -All
```

## 📖 详细说明

### 🏥 健康检查工具 (`health-check.ps1`)

**功能：**
- 检查仓库大小和大文件
- 验证 Git 状态和提交历史
- 检查关键文件完整性
- 验证 SVG 动画文件
- 检查 README 中的链接
- 提供优化建议

**使用示例：**
```powershell
.\scripts\health-check.ps1
```

**输出：**
- 📊 仓库大小统计
- 📄 大文件列表
- 🔗 链接检查结果
- 💡 优化建议

### 🚀 快速部署工具 (`deploy.ps1`)

**功能：**
- 自动添加文件到 Git 暂存区
- 生成详细的提交信息
- 推送到 GitHub
- 预提交检查（大文件警告）
- 可选的健康检查

**参数：**
- `-Message` - 自定义提交信息
- `-SkipHealthCheck` - 跳过健康检查
- `-Force` - 强制执行，跳过确认

**使用示例：**
```powershell
# 基本部署
.\scripts\deploy.ps1

# 自定义提交信息
.\scripts\deploy.ps1 -Message "🎨 更新主页设计"

# 跳过健康检查
.\scripts\deploy.ps1 -SkipHealthCheck

# 强制部署
.\scripts\deploy.ps1 -Force
```

### 🔧 仓库优化工具 (`optimize-repo.ps1`)

**功能：**
- 分析仓库大小和结构
- 清理临时文件
- Git 仓库优化（gc, repack）
- 查找历史中的大文件
- 高级清理选项

**参数：**
- `-DryRun` - 预览模式，不执行实际更改
- `-Aggressive` - 激进清理模式
- `-CleanHistory` - 清理 Git 历史（危险操作）

**使用示例：**
```powershell
# 预览优化
.\scripts\optimize-repo.ps1 -DryRun

# 标准优化
.\scripts\optimize-repo.ps1

# 激进清理
.\scripts\optimize-repo.ps1 -Aggressive

# 历史清理（危险）
.\scripts\optimize-repo.ps1 -CleanHistory
```

### 📝 README 更新工具 (`update-readme.ps1`)

**功能：**
- 分析项目技术栈
- 统计代码行数和文件数量
- 检查链接有效性
- 生成更新建议
- 项目结构分析

**参数：**
- `-UpdateStats` - 更新统计信息
- `-UpdateTechStack` - 更新技术栈
- `-UpdateProjects` - 更新项目信息
- `-All` - 执行所有更新
- `-DryRun` - 预览模式

**使用示例：**
```powershell
# 分析所有内容
.\scripts\update-readme.ps1 -All

# 只更新技术栈
.\scripts\update-readme.ps1 -UpdateTechStack

# 预览模式
.\scripts\update-readme.ps1 -All -DryRun
```

## 🎯 工作流程建议

### 📅 日常维护流程

1. **健康检查**
   ```powershell
   .\scripts\manage.ps1 health
   ```

2. **优化仓库**（如果需要）
   ```powershell
   .\scripts\manage.ps1 optimize -DryRun  # 先预览
   .\scripts\manage.ps1 optimize          # 执行优化
   ```

3. **更新内容**
   ```powershell
   .\scripts\manage.ps1 update -All
   ```

4. **部署更改**
   ```powershell
   .\scripts\manage.ps1 deploy -Message "📝 日常维护更新"
   ```

### 🚀 快速部署流程

```powershell
# 一键部署（包含健康检查）
.\scripts\manage.ps1 deploy

# 快速部署（跳过检查）
.\scripts\manage.ps1 deploy -SkipHealthCheck -Force
```

### 🔍 问题排查流程

1. **查看状态**
   ```powershell
   .\scripts\manage.ps1 status
   ```

2. **运行健康检查**
   ```powershell
   .\scripts\manage.ps1 health
   ```

3. **清理临时文件**
   ```powershell
   .\scripts\manage.ps1 clean
   ```

4. **优化仓库**
   ```powershell
   .\scripts\manage.ps1 optimize
   ```

## ⚠️ 注意事项

### 🔒 安全提醒
- 使用 `-CleanHistory` 参数前请备份仓库
- 大文件操作建议使用 Git LFS
- 敏感信息不要提交到仓库

### 💡 最佳实践
- 定期运行健康检查
- 使用预览模式测试脚本
- 保持提交信息清晰明确
- 监控仓库大小变化

### 🐛 故障排除
- 确保 PowerShell 执行策略允许脚本运行
- 检查 Git 配置和权限
- 网络问题可能影响推送操作

## 📞 支持

如果遇到问题或有改进建议，请通过以下方式联系：

- 📧 邮箱：hi@chillg.de
- 🌐 博客：https://www.chillg.de
- 📦 GitHub：https://github.com/Asakushen

## 📄 许可证

这些脚本遵循与主项目相同的许可证。