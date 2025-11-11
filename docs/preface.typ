#import "/templates/math-template.typ": *
#import "/book.typ": book-page

#show: book-page.with(title: "LuaSTG 数学基础")
#show: content => math-tutorial(content)

= 前言

本系列教程介绍LuaSTG制作弹幕涉及的一些基础的数学理论,
并附带相关弹幕的Sharp工程辅助理解.

每一小节可能会提出一些习题,
主要是对该节基础内容的考察 (较简单),
以及从实际弹幕衍生的数学问题 (可能较难).
答案仅提供一种可行解法,
读者有其他思路也是可以的.

*本教程会使用不规范的表示方法*,
注意不要在正式场合误用 (笑);

如果你遇到了不认识的术语或记号,
我准备了一个记号表,
也许可以帮助到你.

本教程使用Typst编写,
若希望在本教程基础上修改完善,
可以联系我, 或者在Github上获取源码:
https://github.com/TengoDango/LstgMathTutorial

我的能力有限, 教程中难免出现疏漏或谬误, 欢迎读者批评指正.
如果想要就教程内容展开交流, 也欢迎在LuaSTG交流群提出.
十分感谢您阅读本教程!

#align(right, [By 大玉团子])
