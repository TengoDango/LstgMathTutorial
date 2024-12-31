
// 页面尺寸属性
#set text(size: 12pt)
#set page(margin: 2cm)
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
#set table(align: horizon, inset: 3mm)
#import "@preview/cetz:0.3.1"
// enum
#set enum(numbering: "(a)")
// 缩写
#let polar(r, a) = $angle.l #r, #a angle.r$

#let s0 = []
#let s1-1 = [1.1 极坐标系与三角函数]
#set align(center)
#table(
  columns: (auto, auto, auto, auto),
  table.header([名称], [记号], [说明], [对应章节]),
  [极坐标], $polar(r, theta)$, [极径为 $r$, 极角为 $theta$ 的极坐标], s1-1,
  [
    正弦函数 \
    余弦函数 \
    正切函数 \
  ],
  $
    sin alpha \
    cos alpha \
    tan alpha \
  $,
  [
    角 $alpha$ 的正弦值 \
    角 $alpha$ 的余弦值 \
    角 $alpha$ 的正切值 \
  ],
  s1-1,

  [方位角],
  $
    angle A, angle arrow(r), \
    angle(A, B)
  $,
  [
    原点到点 $A$ 的连线方向角度 \
    向量 $arrow(r)$ 的方向角度 \
    点 $A$ 到点 $B$ 的连线方向角度 \
  ],
  s1-1,
)
