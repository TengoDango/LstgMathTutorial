#import "../template.typ": *
#show: math-tutorial

= #s1-1

== 极坐标系

我们经常使用直角坐标系来描述obj的位置,
用横坐标和纵坐标可以确定一个点的位置.
我们将 $("横坐标", "纵坐标")$ 称为直角坐标.

还有一组常用的属性可以确定点的位置,
那就是该点相对于某个已知点的距离和方向.
由此我们引入极坐标系的概念.

在介绍极坐标系前, 我们先回顾一下直角坐标系的定义.

#mbox(title: [直角坐标系])[
  如@rect-coord 所示,
  指定平面上一点 $O$, 称为*原点*.
  指定两条数轴, 它们具有相同的原点 $O$ 和相同的单位长度,
  且相互垂直, 称为 *$x$ 轴*和 *$y$ 轴*.

  #let P = (2, 1.5)

  @rect-coord 中将点 $P$ 向 $x$ 轴和 $y$ 轴投影,
  在 $x$ 轴上对应的数 $x_P = #P.at(0)$,
  称为点 $P$ 的*横坐标*;
  在 $y$ 轴上对应的数 $y_P = #P.at(1)$,
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

现在我们来看一下极坐标系的定义:

#mbox(title: [极坐标系])[
  如@polar-coord 所示,
  指定平面上一点 $O$, 称为*极点*.
  以点 $O$ 为端点作一条射线, 称为*极轴*.
  指定极轴方向为 $0degree$,
  *逆时针*方向为正方向.

  对于平面上一点 $P$ (不为极点),
  + 将点 $P$ 到极点的距离称为点 $P$ 的*极径*,
    记作 $abs(O P)$;
  + 将点 $P$ 相对极点的方向角 (即 $O P$ 连线方向角)
    称为点 $P$ 的*极角*, 记作 $angle(O P)$.

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
      point(O, P)
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
  $polar(0, "任意实数")$.
]

我们用大小和方向来控制obj的速度,
这就是极坐标的一个直接应用.

极坐标系的一个问题是, 同一个位置可以有不同的极坐标.
将@polar-coord 的点 $P$ 绕极点旋转 $360degree$,
点 $P$ 的位置不会改变, 所以
$polar(r, theta)$ 和 $polar(r, theta + 360degree)$
表示同一个位置. 类似地
$polar(-r, theta)$ 和 $polar(r, theta + 180degree)$
也表示同一个位置.

我们规定极径不能为负数, 这样一个点的极径就是唯一的了.
尽管极角仍然不唯一, 但所有可能的极角相差 $360degree$ 的整数倍
(不考虑极点), 它们代表的方向是相同的, 一般不会带来问题.

#mbox[
  两个方向角表示相同的方向, 这是一种等价关系.
  数值上, 这两个角相等或者相差 $360degree$ 的整数倍,
  记作 $ alpha equiv beta. $
]

"$equiv$" 是数论里的符号, 表示两个数被某个数除的余数相等,
称为同余. 同余的概念将在 #raw(ex-1) 进一步介绍.

== 三角函数

三角函数揭示了角度和坐标比例的关系,
是弹幕制作中非常常用的一类函数.
我们主要讨论其中的三个函数:
正弦sin, 余弦cos, 正切tan.

#mbox(title: [三角函数])[
  如@sine 所示, 单位圆 (圆心为原点, 半径为单位长度1的圆)
  上有一点 $P = (x_p, y_p)$,
  相对原点的方向角 $angle(P) = alpha$.
  根据点 $P$ 的坐标就可以确定 $alpha$ 的三角函数值:
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
      arc((r-arc, 0), start: 0deg, stop: 120deg, radius: r-arc, name: "arc")
      // 标记
      mcontent((max, 0), $x$, east)
      mcontent((0, max), $y$, west)
      mcontent((-r, 0), $-1$, south-west)
      mcontent((r, 0), $1$, south-east)
      mcontent((0, -r), $-1$, south-east)
      mcontent((0, r), $1$, north-east)
      mcontent(O, $O$, south-west)
      mcontent(P, $(cos alpha, sin alpha) = P$, north-west)
      mcontent("arc.45deg", $alpha$, north-east)
    })
  ] <sine>
]

三角函数经常被用来将 *距离和方向* 转换为 *横纵坐标*.
如果一个点与原点的距离为 $r$, 相对原点的方向角为 $theta$,
那么我们可以得到该点的直角坐标
$(r cos theta, r sin theta)$.

== 勾股定理

勾股定理描述了直角三角形三条边的长度之间的关系,
它经常被用来计算两点之间的距离.

#mbox(title: [勾股定理])[
  如@square-length, 平面上有两点
  $A = (x_1,y_1), B = (x_2,y_2)$,
  $A,B$ 之间的距离为 $abs(A B) = r$.
  直角三角形 $A B C$ 三边长度
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
      let (A, B) = ((0, 0), (3, 1.5))
      let C = (B.at(0), 0)
      // 连线
      point(A, B, C)
      line(A, B)
      mcontent(A, $A=(x_1,y_1)$, west, padding: 1.5mm)
      mcontent(B, $B=(x_2,y_2)$, east, padding: 1.5mm)
      mcontent((A, 50%, B), $r$, north)
      // 水平铅直线
      set-style(stroke: (dash: "dashed"))
      line(A, C, B)
      mcontent(C, $C$, east)
    })
  ] <square-length>
]

这样我们就得到了平面上两点的*距离公式*
$
  "Dist"(x_1,y_1,x_2,y_2) :=
  sqrt((x_1-x_2)^2 + (y_1-y_2)^2).
$

== 反三角函数与角度求解

很不严谨地说, 反三角函数是三角函数的逆运算,
它们由给定的三角函数值计算对应的角度.
由于反三角函数的一些问题 (在 #raw(ex-3) 讲述),
我并不想在这里介绍反三角函数的具体定义.

使用反三角函数的目的基本上是由坐标求方向角.
LuaSTG有两个函数可以计算点 $(x,y)$ 的方向角:

- `Angle(0,0,x,y)`
- `atan2(y,x)`

上面两个函数的值域都是
$-180degree < dot <= 180degree$.

我们沿用方向角的记号, 把点 $(x,y)$ 的方向角记作
$angle(x, y)$.

== 直角坐标与极坐标的转换

#figure(
  caption: [直角坐标系与极坐标系],
  cetz.canvas({
    import cetz.draw: *
    scale(0.8)
    let r = 3.7
    // 网格
    polar-grid(r, (0deg, 360deg), 1, 45deg)
    line((-r, 0), (r, 0), mark: (end: "straight"))
    line((0, -r), (0, r), mark: (end: "straight"))
    // 直角坐标系
    mcontent((r, 0), $x$, east)
    mcontent((0, r), $y$, west)
    mcontent((0, 0), box($O$, fill: white), south-west)
    for k in range(1, calc.floor(r) + 1) {
      mcontent((k, 0), $#k$, south-west)
      mcontent((0, k), $#k$, south-west)
      mcontent((-k, 0), $-#k$, south-west)
      mcontent((0, -k), $-#k$, south-west)
    }
    // 极坐标系
    let dir = (west, east, east, west)
    for k in range(4) {
      let a = -135 + 90 * k
      mcontent((a * 1deg, r), $#(a)degree$, dir.at(k))
    }
  }),
) <coord>

如@coord 所示,
直角坐标系和极坐标系的原点和极点重合, 单位长度相同,
$x$ 轴正方向为极轴方向.

设平面上有一点, 直角坐标为 $(x,y)$,
极坐标为 $polar(r, theta)$.

=== 极坐标转换为直角坐标

用三角函数可以将极坐标转换为直角坐标:
$
  x = r cos theta \
  y = r sin theta \
$

=== 直角坐标转换为极坐标

由勾股定理, 有 $ r = sqrt(x^2 + y^2), $
LuaSTG中可以用 `Dist(0,0,x,y)` 或 `hypot(x,y)` 计算.

极角 $theta$ 是 $(x,y)$ 相对极点的方向角, 也就是
$ theta = angle(x, y), $
LuaSTG中可以用 `Angle(0,0,x,y)` 或 `atan2(y,x)` 计算.

#conclude[
  - 极坐标系
  - 三角函数
  - 用勾股定理求两点距离
  - 极坐标与直角坐标的转换
][
  + #titlize[龙纹弹]
    设平面直角坐标系上有一个圆,
    圆心为 $A = (x_0, y_0)$,
    半径为 $R$.
    圆 $A$ 上有一点 $P$,
    点 $P$ 相对点 $A$ 的方向角为 $alpha$.
    求点 $P$ 的直角坐标.

    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        let A = (0, 0)
        let P = (20deg, 1.5)
        let R = (20deg, 2.2)
        circle(A, radius: 1.5)
        point(A, P)
        line(A, R)
        mcontent(A, $A$, south-west)
        mcontent(R, $alpha$, east)
        mcontent(P, $P$, north, fill: white, padding: 2mm)
      }),
    )

  + #titlize[连线激光]
    设平面上有两个点
    $A = (x_1, y_1), B = (x_2, y_2)$,
    求点 $A,B$ 之间的距离 $abs(A B)$
    和 $B$ 相对 $A$ 的方向角 $angle(A B)$.

  + 证明: $(cos theta)^2 + (sin theta)^2 = 1$.

  + #titlize[激光与圆相交, 较难]
    如下图, 点 $O'$ 的极坐标为 $polar(L, alpha)$,
    圆 $O'$ 的半径为 $R$.

    #set enum(numbering: "(1)")
    + 若 $L > R$,
      问 $alpha$ 满足什么条件时, 圆 $O'$ 与 $x$ 轴*正半轴*相交?
    + 若 $L > R$, 且圆 $O'$ 与 $x$ 轴正半轴交于 $A,B$ 两点,
      $A$ 离原点更近 (即图中情况), 求 $O A$ 长度?
    + 若 $L < R$, 那么圆 $O'$ 与
      $x$ 轴正半轴总有唯一交点 $A$.
      试求 $abs(O A)$?
    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        // 参数
        let L = 3.6
        let R = 1.6
        let a = 18deg
        let (x1, x2, y1, y2) = (-1, 7, -1, 3)
        // 锚点
        let h = L * calc.sin(a)
        let d = L * calc.cos(a)
        let dd = calc.sqrt(R * R - h * h)
        let O = (0, 0)
        let OO = (a, L)
        let A = (d - dd, 0)
        let B = (d + dd, 0)
        point(O, OO, A, B)
        // 坐标轴
        line((x1, 0), (x2, 0), mark: (end: "straight"))
        line((0, y1), (0, y2), mark: (end: "straight"))
        mcontent((x2, 0), $x$, east)
        mcontent((0, y2), $y$, west)
        mcontent(O, $O$, south-west)
        // 射线与圆
        circle(OO, radius: R)
        line(O, (a, L))
        mcontent(A, $A$, south-west)
        mcontent(B, $B$, south-east)
        mcontent(OO, $O'$, north-east)
        // 角度标注
        let r = 0.7
        arc((r, 0), radius: r, start: 0deg, stop: a)
        mcontent((a * 0.6, r + 0.2), $alpha$, none)
      }),
    )
]
