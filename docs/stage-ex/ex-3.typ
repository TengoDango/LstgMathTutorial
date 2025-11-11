#import "/templates/math-template.typ": *
#import "/book.typ": book-page

#show: book-page.with(title: "LuaSTG 基础数学")
#show: content => math-tutorial(content)

= #ex-3

三角函数由角度计算单位圆上的坐标信息.
反三角函数就是反过来,
由单位圆上的坐标信息计算对应角度.
对于三角函数 $sin, cos, tan$,
数学中我们把对应的反三角函数函数记作
$arcsin, arccos, arctan$,
而编程中对应的反三角函数为
`asin,acos,atan`.

== 定义

#mbox(title: $arccos$)[
  对于 $-1 <= x_0 <= 1$,
  $arccos x_0$ 存在.

  要计算 $arccos x_0$,
  只需要在单位圆上找一个点 $polar(1, theta)$,
  使得该点的横坐标为 $x_0$,
  这时有 $cos theta = x_0$.
  如@arccos 所示,
  竖直线 $x = x_0$ 与单位圆的交点即满足条件.

  考虑到直线与圆可以有两个交点,
  并且一个交点对应的方向角也不是唯一的,
  我们规定取 $0degree <= theta <= 180degree$
  的角 $theta$ 作为 $arccos x_0$ 的结果.

  #figure(
    caption: $arccos$,
    cetz.canvas({
      import cetz.draw: *
      let (r, m) = (2, 2.7)
      // 单位圆
      line((-m, 0), (m, 0), mark: (end: "straight"))
      line((0, -m), (0, m), mark: (end: "straight"))
      mcontent((m, 0), $x$, east)
      mcontent((0, m), $y$, west)
      mcontent((0, 0), $O$, south-west)
      circle((0, 0), radius: r)
      let x = -0.6
      let a = calc.acos(x)
      x *= r
      let l = 2.4
      let ll = -0.5
      // 多实例
      for x in (0.3, 0.6, 0.9, -0.3, -0.6, -0.9) {
        let a = calc.acos(x)
        let x = x * r
        line((x, ll), (x, l), stroke: gray)
        // point((a, r))
        line((0, 0), (a, r), stroke: gray)
      }
      // 单例
      line((x, ll), (x, l))
      mcontent((x, l), $x = x_0$, west, fill: box-gray)
      point((a, r))
      line((0, 0), (a, r))
      let s = 0.25
      arc((s, 0), radius: s, start: 0deg, stop: a)
      mcontent((a * 0.4, s * 2), $theta$, none, fill: box-gray)
    }),
  ) <arccos>
]

#mbox(title: $arcsin$)[
  对于 $-1 <= y_0 <= 1$,
  $arcsin y_0$ 存在.

  要计算 $arcsin y_0$,
  只需要在单位圆上找一个点 $polar(1, theta)$,
  使得该点的纵坐标为 $y_0$,
  这时有 $sin theta = y_0$.
  如@arcsin 所示,
  水平线 $y = y_0$ 与单位圆的交点即满足条件.

  与 $arccos$ 类似, 我们需要限制结果的角度范围.
  规定取 $-90degree <= theta <= 90degree$
  的角 $theta$ 作为 $arcsin y_0$ 的结果.

  #figure(
    caption: $arcsin$,
    cetz.canvas({
      import cetz.draw: *
      let (r, m) = (2, 2.7)
      // 单位圆
      line((-m, 0), (m, 0), mark: (end: "straight"))
      line((0, -m), (0, m), mark: (end: "straight"))
      mcontent((m, 0), $x$, east)
      mcontent((0, m), $y$, west)
      mcontent((0, 0), $O$, south-west)
      circle((0, 0), radius: r)
      let y = -0.6
      let a = calc.asin(y)
      y *= r
      let l = 2.4
      let ll = -0.5
      // 多实例
      for y in (0.3, 0.6, 0.9, -0.3, -0.6, -0.9) {
        let a = calc.asin(y)
        let y = y * r
        line((ll, y), (l, y), stroke: gray)
        // point((a, r))
        line((0, 0), (a, r), stroke: gray)
      }
      // 单例
      line((ll, y), (l, y))
      mcontent((l, y), $y = y_0$, east, fill: box-gray)
      point((a, r))
      line((0, 0), (a, r))
      let s = 0.25
      arc((s, 0), radius: s, start: 0deg, stop: a)
      mcontent((a * 0.4, s * 2), $theta$, none, fill: box-gray)
    }),
  ) <arcsin>
]

#mbox(title: $arctan$)[
  $arctan k$ 对于任意实数 $k$ 存在.

  设平面上一点 $(1, k)$ 的方向角为 $theta$,
  则 $tan theta = k \/ 1 = k$.

  规定取 $-90degree < theta < 90degree$
  的角 $theta$ 作为 $arctan k$ 的结果.

  #figure(
    caption: $arctan$,
    cetz.canvas({
      import cetz.draw: *
      let (r, m) = (2, 3)
      // 单位圆
      line((-m, 0), (m, 0), mark: (end: "straight"))
      line((0, -m), (0, m), mark: (end: "straight"))
      mcontent((m, 0), $x$, east)
      mcontent((0, m), $y$, west)
      mcontent((0, 0), $O$, south-west)
      circle((0, 0), radius: r)
      let k = 0.9
      let a = calc.atan(k)
      let l = 2.7
      // 多实例
      for k in (0.3, 0.6, 0.9, 1.2) {
        let a = calc.atan(k)
        line((0, 0), (r, r * k), stroke: gray)
        line((0, 0), (r, -r * k), stroke: gray)
      }
      // 单例
      line((r, -l), (r, l), stroke: gray)
      mcontent((r, -l), $x = 1$, north-east)
      point((r, r * k))
      line((0, 0), (r, r * k))
      let s = 0.25
      arc((s, 0), radius: s, start: 0deg, stop: a)
      mcontent((a * 0.5, s * 2), $theta$, none, fill: box-gray)
      mcontent((r, r * k), $(1,k)$, east)
    }),
  ) <arctan>
]

== 值域问题

我们引入反三角函数最主要的目的是用求解角度,
由于任意角的特性, 只要求出的角度范围能覆盖连续
$360degree$ 的范围, 就可以满足应用需求.

但是, 反三角函数只能覆盖 $180degree$ 的范围,
这就导致直接用反三角函数求角度时容易出错.
比如用 $arctan(y \/ x)$ 求 $(x,y)$ 的方向角,
当点 $(x,y)$ 位于第二, 三象限时就会得到错误的结果.

一般的处理方法是分类讨论点所在的象限,
预先确定角度范围, 再通过反三角函数求角度.
LuaSTG提供了 `atan2` 和 `Angle` 函数来方便求解角度.

#conclude[
  - 反三角函数的定义
  - 为什么不推荐直接用反三角函数
][]
