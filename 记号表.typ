#import "template.typ": *
#show: content => math-tutorial(content)

#let s0 = []
#let s1-1 = [1.1 极坐标系与三角函数]
#set align(center)
#table(
  columns: 4,
  table.header([*名称*], [*记号*], [*说明*], [*对应章节*]),
  [距离 \ 极径],
  $ abs(A B) \ abs(P) $,
  [
    点 $A$ 与点 $B$ 的距离 \
    点 $P$ 与极点的距离 \
  ],
  s1-1,

  [方位角 \ 极角],
  $ angle(A B) \ angle(P) $,
  [
    点 $B$ 相对点 $A$ 的方位角 \
    点 $P$ 相对极点的方位角 \
  ],
  s1-1,

  [正弦 \ 余弦 \ 正切],
  $sin theta \ cos theta \ tan theta$,
  [
    角 $theta$ 的三角函数值
  ],
  s1-1,

  [反正弦 \ 反余弦 \ 反正切],
  $arcsin x \ arccos x \ arctan x$,
  [
    数 $x$ 的反三角函数值
  ],
  s1-1,
  
)
#table(
  columns: 2,
  table.header([*数学表达式*], [*Lua代码*]),
  $(x,y)=(r cos theta, r sin theta)$,
  [
    `x, y = r*cos(theta), r*sin(theta)`
  ],

  $angle(x, y)$,
  [
    `Angle(0,0,x,y)` 或 `atan2(y, x)`
  ],
)
