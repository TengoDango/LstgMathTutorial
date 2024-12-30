// 页面尺寸属性
#set text(size: 12pt)
// 分级标题
#show heading.where(level: 1): it => [
  #set align(center)
  #block(it.body, inset: 16pt)
]
#show heading.where(level: 2): it => [
  #set align(center)
  #block(
    [------ ] + it.body + [ ------],
    inset: 5pt,
  )
]
// 图表
#show figure.where(kind: image): set figure(supplement: [图])
#show figure.where(kind: table): set figure(supplement: [表])
#import "@preview/cetz:0.3.1"
// enum
#set enum(numbering: "(a)")

= 前言

本系列教程介绍用 `LuaSTG` 制作弹幕需要的一些基础的数学理论,
并附带相关弹幕的 `Sharp` 工程以辅助理解.

各小节可能会提出一些习题, 主要是对该节基础内容的考察 (较简单),
以及从实际弹幕衍生的数学问题 (较难).
答案仅提供一种可行解法, 读者有其他解决问题的思路是当然可以的.

本教程主要基于初高中数学构建知识框架,
从坐标系着手, 延伸至运动学, 曲线方程等弹幕相关理论.
我希望能够在一开始就介绍向量和矩阵的概念,
虽然我们一般在高中 (甚至大学) 才接触它们,
但对弹幕而言引入向量和矩阵是非常自然的,
它们对于表达和理解其他的理论有很大帮助.

最后还有两件事:

+ 本教程会使用一些不规范的记号表示,
  注意不要在正式场合误用 (笑);
+ 我准备了收录记号表的PDF, 如果你遇到了不认识的写法,
  也许可以在那里找到.

本教程使用 `Typst` 编写,
若希望在本教程基础上修改完善,
可以联系我, 或者在Github上获取源码:
https://github.com/TengoDango/LstgMathTutorial

我的精力和能力有限, 教程中难免出现疏漏或谬误, 欢迎读者批评指正.
如果想要就教程内容展开交流,
也欢迎在 `LuaSTG` 交流群提出.
十分感谢您阅读本教程!

#align(right, [By 大玉团子])
