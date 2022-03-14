## 下一个版本
$version = $(convco version --bump)

## 生成该版本的日志
convco changelog > CHANGELOG.md

## 修改 [Unreleased] --> "[v$version]"
(Get-Content CHANGELOG.md) -replace '\[Unreleased\]', "[v$version]" | Set-Content CHANGELOG.md

# 提交 CHANGELOG.md
git add .
git commit -m "docs: $version CHANGELOG.md"

# 发布版本
Write-Output y | cargo release --execute $version

pause