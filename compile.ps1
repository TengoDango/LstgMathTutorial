# 设置PDF输出根目录
$pdfOutputRootDir = "bin"

# 检查并创建PDF输出根目录（如果它不存在）
if (-not (Test-Path -Path $pdfOutputRootDir)) {
    New-Item -Path $pdfOutputRootDir -ItemType Directory | Out-Null
}

# 获取当前目录及其子目录下的所有 .typ 文件
$typFiles = Get-ChildItem -Path . -Filter *.typ -Recurse -File
$currentDir = Get-Location

foreach ($file in $typFiles) {
    # 跳过模板文件
    if ($file.Name -eq 'template.typ') {
        continue
    }

    # 计算相对于当前目录的相对路径
    $relativePath = $file.FullName.Substring($PWD.Path.Length).TrimStart('\', '/')

    # 构建PDF输出子目录路径，保持与源文件相同的相对路径结构
    $outputSubDir = Join-Path -Path $pdfOutputRootDir -ChildPath ([System.IO.Path]::GetDirectoryName($relativePath))
    
    # 确保目标子目录存在
    if (-not (Test-Path -Path $outputSubDir)) {
        New-Item -Path $outputSubDir -ItemType Directory | Out-Null
    }

    # 构建输出PDF文件名，假设与源文件同名但扩展名为.pdf
    $outputPdf = Join-Path -Path $outputSubDir -ChildPath ([System.IO.Path]::ChangeExtension([System.IO.Path]::GetFileName($relativePath), ".pdf"))

    # 输出正在处理的文件路径和输出PDF路径
    Write-Host "Processing file: $($file.FullName)"
    Write-Host "Output PDF: $outputPdf"

    # 编译Typst文件到PDF
    & typst compile $file.FullName "$outputPdf" --root $currentDir

    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Failed to compile $($file.FullName)"
    } else {
        Write-Host "Successfully compiled $($file.FullName) to $outputPdf"
    }
}