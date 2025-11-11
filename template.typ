/// 模板文件

/* 导入模块 */
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.0"
#import "@preview/ctheorems:1.1.3": *

/// 教程文档模板
/// - body (content):
/// -> content
#let math-tutorial(body) = {
  // 页面属性
  set text(font: ("Times New Roman", "Source Han Sans SC"))
  // set page(margin: 1.5cm, numbering: "1")

  // 大标题
  show heading.where(level: 1): it => {
    set align(center)
    block(it.body, inset: 16pt)
  }

  // 小标题
  show heading.where(level: 2): it => {
    set align(center)
    block([--------- ] + it.body + [ --------- ], inset: 5pt)
  }

  // 强调
  show strong: set text(blue)

  // 代码块
  show raw: set text(font: ("Consolas", "Source Han Sans SC"))

  // 图表
  show figure.where(kind: image): set figure(supplement: "图")
  show figure.where(kind: table): set figure(supplement: "表")
  set table(align: horizon, inset: 3mm)
  show figure.caption: set text(font: ("Source Han Sans SC"))

  // 有序列表
  set enum(numbering: "(a)")

  // 链接
  show link: underline
  show link: set text(font: "Consolas")

  // 定理
  show: thmrules.with(qed-symbol: "")

  // 大于号小于号样式
  show sym.lt.eq: sym.lt.eq.slant
  show sym.gt.eq: sym.gt.eq.slant

  // 平行符号样式
  show sym.parallel: sym.slash.double

  // 矩阵样式
  set math.mat(delim: "(")

  body
}

/// 总结 & 习题
#let conclude(..body) = {
  let body = body.pos()
  let n = body.len()
  let conclude = if n >= 1 { body.at(0) } else []
  let homework = if n >= 2 { body.at(1) } else []
  if conclude != [] [
    == 要点总结
    #conclude
  ]
  if homework != [] [
    == 习题
    #set enum(numbering: "1.")
    #homework
  ]
}

/* 定理环境 */

#let titlize(title) = {
  if title == none {
    return none
  }
  show strong: set text(gray)
  strong[(#title) ]
}
#let box-gray = rgb("eeeeee")
#let mbox(content, title: none) = block(
  titlize(title) + content,
  fill: box-gray,
  inset: 8pt,
  width: 100%,
)

#let theorem = thmbox("theorem", "定理", fill: rgb("eeeeee")).with(numbering: none)
#let definition = thmbox("definition", "定义", fill: box-gray).with(numbering: none)
#let example = thmplain("example", "例").with(numbering: none)
#let proof = thmproof("proof", "证明").with(numbering: none)

/*--- 定义 ---*/

#let pm = sym.plus.minus
#let mp = sym.minus.plus
#let rr = $arrow(r)$
#let vv = $arrow(v)$
#let aa = $arrow(a)$
#let ee = $arrow(e)$
#let ff = $arrow(f)$
#let gg = $arrow(g)$
#let hh = $arrow(h)$
#let ii = $hat(i)$
#let jj = $hat(j)$
#let kk = $hat(k)$

#let coord(x, t) = x + "-" + t

/// 极坐标
/// - r (content):
/// - theta (content):
/// -> content
#let polar(r, theta) = $angle.l #r, #theta angle.r$

/// 绘制若干点
#let point(..points, scale: 1) = {
  for P in points.pos() {
    cetz.draw.circle(P, radius: 1pt / scale, stroke: 2pt)
  }
}

/// 线性插值
/// - A (array):
/// - B (array):
/// - k (float):
/// -> array
#let linear(A, B, k) = {
  A.zip(B).map((a, b) => a * (1 - k) + b * k)
}

#let north = "south"
#let south = "north"
#let west = "east"
#let east = "west"
#let north-west = "south-east"
#let north-east = "south-west"
#let south-west = "north-east"
#let south-east = "north-west"

/// 简化 content
#let mcontent(position, body, anchor, fill: none, ..params) = cetz.draw.content(
  position,
  box(body, fill: fill, inset: 1pt),
  anchor: anchor,
  padding: params.at("padding", default: 1mm),
  ..params,
)

/// 极坐标网格
/// - radius (float):
/// - angle (array):
/// - step-radius (float):
/// - step-angle (angle):
#let polar-grid(radius, angle, step-radius, step-angle) = {
  import cetz.draw: *
  let r = 0
  let (from, to) = angle
  while r <= radius {
    arc((r * calc.cos(from), r * calc.sin(from)), radius: r, stroke: gray, start: from, stop: to)
    r += step-radius
  }
  while from <= to {
    line((0, 0), (from, radius), stroke: gray)
    from += step-angle
  }
}

#let spellcard(sign, name) = [
  #sign$ceil.l$#name$floor.r$
]

/* 文档标题 */
#let s0 = ""
#let s1-1 = "1.1 极坐标系与三角函数"
#let s1-2 = "1.2 三角函数公式"
#let s1-3 = "1.3 平面向量"
#let s1-4 = "1.4 线性变换与仿射坐标系"
#let s2-1 = "2.1 运动学基础"
#let s2-2 = "2.2 基本的运动模型"
#let s2-3 = "2.3 运动的合成与分解"
#let s2-4 = "2.4 曲线与方程"
#let s2-5 = "2.5 常见曲线简析"
#let s3-1 = "3.1 三维向量和坐标系"
#let s3-2 = "3.2 定轴旋转"
#let ex-1 = "EX.1 同余"
#let ex-2 = "EX.2 弧度制"
#let ex-3 = "EX.3 反三角函数"
#let ex-4 = "EX.4 概率论"
