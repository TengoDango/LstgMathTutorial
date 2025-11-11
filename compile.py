from pathlib import Path
import typst

current_dir = Path(".")
template = Path("template.typ")

# PDF 输出根目录
output_dir = Path("bin")
output_dir.mkdir(exist_ok=True, parents=True)

# 当前目录及子目录下非模板 typst 文件
for typ_input in Path(".").rglob("*.typ"):
    # 跳过模板文件
    if typ_input == template:
        continue
    # 计算输出路径
    pdf_output = Path(output_dir, typ_input.with_suffix(".pdf"))
    pdf_output.parent.mkdir(exist_ok=True, parents=True)
    # 编译到 PDF
    print(pdf_output)
    typst.compile(typ_input, pdf_output, root=current_dir)
