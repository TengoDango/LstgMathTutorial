#import "template.typ": *
#show: content => math-tutorial(content)

#set align(center)
#table(
  columns: 4,
  table.header([*名称*], [*记号*], [*说明*], [*对应章节*]),
  [距离 \ 极径 \ 模长],
  $ abs(A B) \ abs(P) \ abs(arrow(r)) $,
  [
    点 $A$ 与点 $B$ 的距离 \
    点 $P$ 与极点的距离 \
    向量 $arrow(r)$ 的长度 \
  ],
  s1-1,

  [方位角 \ 极角 \ 方向角],
  $ angle(A B) \ angle(P) \ angle(arrow(r)) $,
  [
    点 $B$ 相对点 $A$ 的方位角 \
    点 $P$ 相对极点的方位角 \
    向量 $arrow(r)$ 对应的平移方向角 \
  ],
  s1-1,

  [极坐标],
  $polar(r, theta)$,
  [
    相对极点距离为 $r$,
    方位角为 $theta$ 的位置
  ],
  s1-1,

  [正弦 \ 余弦 \ 正切],
  $ sin theta \ cos theta \ tan theta $,
  [
    角 $theta$ 的三角函数值
  ],
  s1-1,

  [反正弦 \ 反余弦 \ 反正切],
  $ arcsin x \ arccos x \ arctan x $,
  [
    数 $x$ 的反三角函数值
  ],
  s1-1,

  [平行 \ 垂直],
  $
    rr_1 parallel rr_2 \
    rr_1 bot rr_2 \
  $,
  [向量, 直线等的几何关系],
  s1-2,

  [夹角],
  $ angle(rr_1, rr_2) $,
  [
    向量 $rr_1, rr_2$ 的夹角 \
    $-180degree < dot <= 180degree$
  ],
  s1-2,

  [内积 \ 外积],
  $
    rr_1 dot rr_2 \
    rr_1 times rr_2 \
  $,
  [向量 $rr_1, rr_2$ 的内积/外积运算],
  s1-2,

  [平面基底],
  $ (ee_1, ee_2) $,
  [
    不共线的平面向量 $ee_1, ee_2$

    可以确定平面上任一向量
  ],
  s1-3,

  [仿射坐标系],
  $ (A, ee_1, ee_2) $,
  [
    由点 $A$ 和基底 $ee_1, ee_2$
    确定的坐标系
  ],
  s1-3,
)
#table(
  columns: 2,
  table.header([*常量记号*], [*值*]),
  $ii$, [向量 $(1,0)$ 或 $(1,0,0)$],
  $jj$, [向量 $(0,1)$ 或 $(0,1,0)$],
  $kk$, [向量 $(0,0,1)$],
  
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
