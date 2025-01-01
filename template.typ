/// 模板文件

/* 导入模块 */
#import "@preview/cetz:0.3.1"
#import "@preview/ctheorems:1.1.3": *

/// 教程文档模板
///
/// - body (content):
/// -> content
#let math-tutorial(body) = {
  // 页面属性
  set text(font: ("Times New Roman", "Source Han Serif SC"))
  set page(margin: 1.5cm, numbering: "1")

  // 大标题
  show heading.where(level: 1): it => {
    set align(center)
    block(it.body, inset: 16pt)
  }

  // 小标题
  show heading.where(level: 2): it => {
    set align(center)
    block(
      [--------- ] + it.body + [ ---------],
      inset: 5pt,
    )
  }

  // 图表
  show figure.where(kind: image): set figure(supplement: "图")
  show figure.where(kind: table): set figure(supplement: "表")
  set table(align: horizon, inset: 3mm)
  show figure.caption: set text(font: ())

  // 有序列表
  set enum(numbering: "(a)")

  // 链接
  show link: underline

  // 定理
  show: thmrules

  // 大于号小于号样式
  show sym.lt.eq: sym.lt.eq.slant
  show sym.gt.eq: sym.gt.eq.slant

  body
}

/* 定理环境 */
#let theorem = thmbox(
  "theorem",
  "定理",
  fill: rgb("eeeeee"),
).with(numbering: none)
#let definition = thmbox(
  "definition",
  "定义",
  fill: rgb("eeeeee"),
).with(numbering: none)
#let example = thmplain("example", "例")
#let proof = thmproof("proof", "证明").with(numbering: none)

/*--- 定义 ---*/

/// 极坐标
/// - r (content):
/// - theta (content):
/// -> content
#let polar(r, theta) = $angle.l #r, #theta angle.r$

/// 绘制一个点
#let point(P, scale: 1) = cetz.draw.circle(
  P,
  radius: 1pt / scale,
  stroke: 2pt,
)

#let north = "south"
#let south = "north"
#let west = "east"
#let east = "west"
#let north-west = "south-east"
#let north-east = "south-west"
#let south-west = "north-east"
#let south-east = "north-west"

/// 简化 content
#let mcontent(
  position,
  body,
  anchor,
  pad: 1mm,
) = cetz.draw.content(
  position,
  body,
  anchor: anchor,
  padding: pad,
)

/// 极坐标网格
/// - radius (float):
/// - angle (array):
/// - step-radius (float):
/// - step-angle (angle):
/// ->
#let polar-grid(radius, angle, step-radius, step-angle) = {
  import cetz.draw: *
  let r = 0
  while r <= radius {
    circle((0, 0), radius: r, stroke: gray)
    r += step-radius
  }
  let (from, to) = angle
  while from <= to {
    line((0, 0), (from, radius), stroke: gray)
    from += step-angle
  }
}
