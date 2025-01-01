#import "../template.typ": *
#show: content => math-tutorial(content)

= 1.1 极坐标系与三角函数

== 极坐标系

我们知道, 在直角坐标系上,
用横坐标和纵坐标可以确定一个点的位置.
我们将 $("横坐标", "纵坐标")$ 称为直角坐标.
弹幕制作中我们通常使用直角坐标来确定一个子弹的位置.

还有一组常用的属性可以确定点的位置,
那就是该点相对于某个已知点的距离和方位.
由此我们引入极坐标系的概念.

在介绍极坐标系前, 我们先回顾一下直角坐标系的定义.

#definition("平面直角坐标系")[
  如@rect-coord 所示,
  指定平面上一点 $O$, 称为*原点*.
  指定两条数轴, 它们具有相同的原点 $O$
  和相同的单位长度, 且相互垂直,
  称为 *$x$ 轴*和 *$y$ 轴*.

  #let P = (2, 1.5)

  @rect-coord 中将点 $P$ 向 $x$ 轴和 $y$ 轴投影,
  在 $x$ 轴上对应的数为 $x_P = #P.at(0)$,
  称为点 $P$ 的*横坐标*;
  在 $y$ 轴上对应的数为 $y_P = #P.at(1)$,
  称为点 $P$ 的*纵坐标*.
  $(x_P, y_P) = (#P.at(0), #P.at(1))$
  称为点 $P$ 的*直角坐标*.

  #figure(caption: [直角坐标系])[
    #cetz.canvas({
      import cetz.draw: *
      let (m, n) = (-2, 3)
      // 网格
      grid((m, m), (n, n), stroke: gray)
      // 坐标轴
      line((m - 0.5, 0), (n + 0.5, 0), mark: (end: "straight"))
      mcontent((n + 0.5, 0), $x$, east)
      line((0, m - 0.5), (0, n + 0.5), mark: (end: "straight"))
      mcontent((0, n + 0.5), $y$, west)
      // 刻度
      for i in range(m, n + 1) {
        if i == 0 { continue }
        mcontent((i, 0), $#i$, south-west)
        mcontent((0, i), $#i$, south-west)
      }
      // OP
      let O = (0, 0)
      mcontent(O, $O$, south-west)
      mcontent(P, $P$, north-east)
      line(O, P)
      point(P)
      line((P.at(0), 0), P, (0, P.at(1)), stroke: (dash: "dashed"))
    })
  ] <rect-coord>
]

// #pagebreak()
现在我们来看一下极坐标系:

#definition("极坐标系")[
  如@polar-coord 所示, 指定平面上一点 $O$, 称为*极点*.
  以点 $O$ 为端点作一条射线, 称为*极轴*.
  指定极轴方向为 $0degree$, *逆时针*方向为正方向.

  对于平面上一点 $P$ (不为极点),
  + 将点 $P$ 到极点的距离 $abs(O P)$
    称为点 $P$ 的*极径*, 记为 $abs(P)$;
  + 将点 $P$ 相对极点的方位角 (即 $O P$ 连线方向角)
    称为点 $P$ 的*极角*, 记为 $angle(P)$.

  我们将 $polar("极径", "极角")$
  称为*极坐标*. 例如@polar-coord 点 $P$
  的极坐标为 $polar(3, 30degree)$.

  #figure(caption: [极坐标系])[
    #cetz.canvas({
      import cetz.draw: *
      // 极坐标网格
      scale(0.8)
      polar-grid(3, (0deg, 360deg), 1, 30deg)
      // 极坐标系
      let (O, P) = ((0, 0), (30deg, 3))
      point(O)
      point(P)
      line(P, O, (3.5, 0), mark: (end: "straight"))
      // 刻度
      for i in (1, 2, 3) {
        mcontent((i, 0), $#i$, south-west)
      }
      // 标注
      mcontent(O, $O$, south-west)
      mcontent(P, $P$, north-east)
      mcontent((3.5, 0), $0degree$, east)
      mcontent((0, 3), $90degree$, north)
      mcontent((-3, 0), $180degree$, west)
      mcontent((0, -3), $270degree$, south)
    })
  ] <polar-coord>

  规定极点 $O$ 的极坐标为
  $polar(0, "任意数值")$.
]

弹幕制作中我们用大小和方向来控制子弹的速度,
这就是极坐标的一个直接应用.

极坐标系的一个问题是, 同一个点可以有不同的极坐标.
将@polar-coord 的点 $P$ 绕极点旋转 $360degree$,
点 $P$ 的位置不会改变, 所以
$polar(r, theta)$ 和 $polar(r, theta + 360degree)$
表示同一个位置. 类似地
$polar(-r, theta)$ 和 $polar(r, theta + 180degree)$
也表示同一个位置.

为了避开这个问题, 我们规定极径不能为负数,
这样一个点的极径就是唯一的了.
尽管极角仍然不唯一,
但所有可能的极角相差 $360degree$ 的整数倍
(不考虑极点),
它们代表的方向是相同的,
因此一般不会带来问题.

#definition("同余角")[
  如果两个角 $alpha,beta$ 相差 $360degree$ 的整数倍,
  那么这两个角被 $360degree$ 除的余数相等.
  这时我们称 $alpha$ 和 $beta$ *同余*, 记作
  $ alpha equiv beta. $
]

在同余意义下, 对于除极点外的其他点, 极坐标是唯一的.
同余的概念将在 `EX.1 同余` 一节进一步介绍.

== 三角函数

三角函数揭示了角度和坐标比例的关系,
是弹幕制作中非常常用的一类函数.
我们主要讨论其中的三个函数:
正弦sin, 余弦cos, 正切tan.

#definition("三角函数")[
  如@sine 所示, *单位圆* (圆心为原点, 半径为单位长度1的圆)
  上有一点 $P = (x_p, y_p)$, 相对原点的方位角
  $angle(P) = alpha$. 定义
  + 余弦函数 $cos(alpha) := x_p$,
  + 正弦函数 $sin(alpha) := y_p$,
  + 正切函数 $tan(alpha) := y_p \/ x_p
    = sin(alpha) \/ cos(alpha)$.

  #figure(caption: [三角函数])[
    #cetz.canvas({
      import cetz.draw: *
      let (min, max, r) = (-2, 2, 1.2)
      let (O, P) = ((0, 0), (120deg, r))
      let r-arc = 3mm
      // 图形
      line((min, 0), (max, 0), mark: (end: "straight"))
      line((0, min), (0, max), mark: (end: "straight"))
      circle(O, radius: r)
      line(O, P)
      point(P)
      arc(
        (r-arc, 0),
        start: 0deg,
        stop: 120deg,
        radius: r-arc,
        name: "arc",
      )
      // 标记
      mcontent((max, 0), $x$, east)
      mcontent((0, max), $y$, west)
      mcontent((-r, 0), $-1$, south-west)
      mcontent((r, 0), $1$, south-east)
      mcontent((0, -r), $-1$, south-east)
      mcontent((0, r), $1$, north-east)
      mcontent(O, $O$, south-west)
      mcontent(
        P,
        $(cos alpha, sin alpha) = P$,
        north-west,
      )
      mcontent("arc.45deg", $alpha$, north-east)
    })
  ] <sine>
]

现在我们思考如何将 横纵坐标 和 距离和方位
两组常用属性进行相互转化,
这是弹幕制作中经常遇到的一个问题.
我们知道横纵坐标对应直角坐标,
而距离和方位对应极坐标,
这个问题等价于直角坐标和极坐标如何相互转换.

在平面上同时建立直角坐标系和极坐标系,
使得原点和极点重合, 单位长度相同,
极轴方向为 $x$ 轴正方向.
若一个点的直角坐标为 $(x,y)$,
极坐标为 $polar(r, theta)$,
则由三角函数的定义容易得到
$
  x = r cos theta, \
  y = r sin theta. \
$

这样我们就知道了极坐标到直角坐标的转换方法.
为了得到直角坐标到极坐标的转换方法,
我们还需要引入一些理论知识.

== 勾股定理

勾股定理描述了直角三角形的三条边的长度之间的关系,
它在弹幕制作中用来计算*两点之间的距离*.

#theorem("勾股定理")[
  如@square-length,
  平面上有两点 $A = (x_1,y_1), B = (x_2,y_2)$,
  $A,B$ 之间的距离为 $abs(A B) = r$.
  勾股定理指出, 直角三角形 $A B C$ 三边长度
  $abs(A B), abs(A C), abs(B C)$ 满足等式
  $
    abs(A B)^2 = abs(A C)^2 + abs(B C)^2.
  $
  把 $A,B$ 的坐标代入上式, 得到
  $
    r^2 = (x_1-x_2)^2 + (y_1-y_2)^2.
  $

  #figure(caption: [两点距离])[
    #cetz.canvas({
      import cetz.draw: *
      let (A, B) = ((0, 0), (2, 1))
      // 连线
      point(A)
      point(B)
      line(A, B)
      mcontent(A, $A=(x_1,y_1)$, west, pad: 1.5mm)
      mcontent(B, $B=(x_2,y_2)$, east, pad: 1.5mm)
      mcontent((A, 50%, B), $r$, north)
      // 水平铅直线
      set-style(stroke: (dash: "dashed"))
      line(A, (B.at(0), 0), B)
      mcontent((B.at(0), 0), $C$, east)
    })
  ] <square-length>
]

这样我们就得到了平面上两点的*距离公式*
$
  #`Dist(x1,y1,x2,y2)` :=
  sqrt( (x_1-x_2)^2 + (y_1-y_2)^2 ).
$

== 反三角函数

反三角函数可以看作三角函数的逆运算,
它们由给定的三角函数值计算对应的角度.
对于三角函数 $sin, cos, tan$,
数学上我们把对应的反三角函数函数记为
$arcsin, arccos, arctan$,
而在`LuaSTG`中对应函数为
`asin,acos,atan`.

我们知道, 对于一个角 $theta$,
$cos theta, sin theta$
是单位圆上某点的横纵坐标.
这启发我们对反三角函数作如下定义:

#definition("反三角函数")[
  要计算 $arccos x_0$,
  就要找到一个角 $theta$ 使得 $cos theta = x_0$.
  横坐标为 $x_0$ 的所有点组成垂直于 $x$ 轴的直线,
  设该直线与单位圆的交点为 $P$,
  则点 $P$ 的方位角 $angle(P)$
  就满足 $cos angle(P) = x_0$.
  
  但是, 该直线与单位圆最多可以有两个交点,
  且每个交点的方位角不唯一.
  因此我们规定, $arccos$ 的结果应当满足
  $0degree <= arccos x_0 <= 180degree$.

  类似地, 要计算 $arcsin y_0$,
  作直线 $y = y_0$, 与单位圆交点的方位角 $theta$
  满足 $sin theta = y_0$.
  规定取 $-90degree <= theta <= 90degree$
  的角作为 $arcsin y_0$ 的结果.

  要计算 $arctan k$, 连接原点和 $(1,k)$,
  线段与单位圆交点的方位角 $theta$
  满足 $tan theta = k$,
  规定取 $-90degree < theta < 90degree$
  的角作为 $arctan k$ 的结果.

  #let (min, max, r, l) = (-2, 2, 1.2, 1.8)
  #let a = 50deg
  #let (O, P) = ((0, 0), (a, r))
  #let r-arc = 3mm
  #let coord = {
    import cetz.draw: *
    line((min, 0), (max, 0), mark: (end: "straight"))
    line((0, min), (0, max), mark: (end: "straight"))
    circle(O, radius: r)
    mcontent((max, 0), $x$, east)
    mcontent((0, max), $y$, west)
    mcontent((r, 0), $1$, south-east)
    mcontent((-r, 0), $-1$, south-west)
    mcontent(O, $O$, south-west)
    line(O, P)
    point(P)
    arc((r-arc, 0), start: 0deg, stop: a, radius: r-arc, name: "arc")
    mcontent("arc", $theta$, north-east)
  }
  #figure(
    caption: [反三角函数],
    grid(
      columns: 3,
      gutter: 1em,
      /* arccos */
      cetz.canvas({
        import cetz.draw: *
        coord
        let x = r * calc.cos(a)
        line((x, 0), (x, l), name: "line")
        mcontent(
          "line.end",
          $x = x_0$,
          south-east
        )
      }),
      /* arcsin */
      cetz.canvas({
        import cetz.draw: *
        coord
        let y = r * calc.sin(a)
        line((0, y), (l, y), name: "line")
        mcontent(
          "line.end",
          $y = y_0$,
          north
        )
      }),
      /* arctan */
      cetz.canvas({
        import cetz.draw: *
        coord
        let T = (r, r * calc.tan(a))
        line(P, T)
        point(T)
        mcontent(T, $(1,k)$, north-east)
      }),
    ),
  ) <arcsin>
]

也许你已经感觉到反三角函数有一些怪异.
我们是为了求方位角而引入反三角函数的,
但是每一个反三角函数单独使用都无法保证求出正确的角度.
特别地, 如果该点的横纵坐标都为负数,
我们可以发现每个反三角函数都不能求出正确的方位角.
这就是反三角函数固有的值域问题.

一种解决方法是分类讨论横纵坐标的正负性,
预先确定角度范围,
再通过反三角函数求方位角.
它的具体实现留给读者思考.

在`LuaSTG`中, `Angle(0,0,x,y)`
可以计算点 $(x,y)$ 的方位角,
我们沿用方位角的记号, 记作 $angle(x,y)$.

`LuaSTG`的`Angle`函数的值域为
$-180degree < theta <= 180degree$,
当我们需要一个具体的方位角取值时,
一般也沿用这个范围.

现在我们可以完成直角坐标到极坐标的转换了.
若一个点的直角坐标为 $(x,y)$,
极坐标为 $polar(r, theta)$, 则
$
  r = sqrt(x^2 + y^2), \
  theta equiv angle(x,y). \
$

== 要点总结

== 习题
