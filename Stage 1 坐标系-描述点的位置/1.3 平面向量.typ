#import "../template.typ": *
#show: math-tutorial

#let aa = $arrow(a)$
#let bb = $arrow(b)$
#let cc = $arrow(c)$
#let dd = $arrow(d)$

= #s1-3

弹幕制作中涉及的许多物理量,
比如位移, 平移量, 速度, 加速度,
具有共同的表示方法, 也就是直角坐标.
为了更方便地表示它们,
我们引入向量的概念.

#mbox(title: [向量])[
  对于实数 $a_1, a_2, ..., a_n$,
  将列表 $(a_1, a_2, ..., a_n)$
  称为一个 *$n$ 维向量*.
  $n$ 称为该向量的*维数*,
  $a_i$ ($i=1,2,...,n$)
  称为该向量的第 $i$ 个*分量*.
]

我们通常用小写英文字母和希腊字母等来指代一个实数,
这些字母在我们指代向量时也经常使用.
为了进行区分, 可以在字母上方加一个箭头表示它是一个向量,
比如 $rr = (3,4)$ 表示一个向量 $rr$ 的值为 $(3,4)$.

#mbox(title: [几何意义])[
  几何上, 我们经常把向量看成空间中的*点*或者*平移量*.
  具体的对应方法就是把向量看成空间中的*直角坐标*,
  这个坐标将确定空间中唯一的点或者平移量.

  注意此处的平移量是不考虑起点和终点的,
  只考虑平移的距离和方向.

  我们目前只关心平面上的东西, 所以现在只讨论2维的向量,
  也称为*平面向量*, 它由两个实数构成.

  #figure(
    caption: [画图时一般用箭头来表示向量/平移量],
    cetz.canvas({
      import cetz.draw: *
      line((-0.5, 0), (4, 0), mark: (end: "straight"))
      line((0, -0.5), (0, 2), mark: (end: "straight"))
      mcontent((4, 0), $x$, east)
      mcontent((0, 2), $y$, west)
      mcontent((0, 0), $O$, south-west)
      line((0.5, 0.5), (3.5, 1.5), mark: (end: "straight"), name: "vec")
      mcontent((0.5, 0.5), $A$, west)
      mcontent((3.5, 1.5), $B$, east)
      mcontent("vec.50%", $rr = (3, 1)$, south-east)
    }),
  )

  有这样的几何意义, 我希望直接用 $A$ 指代点 $A$ 对应的向量,
  以及用 $A B$ 指代从 $A$ 到 $B$ 的平移量对应的向量.
  (虽然正常来说我应该写 $arrow(A)$ 和 $arrow(A B)$)
]

我们可以使用极坐标表示平面向量,
但这时向量的值是对应的直角坐标而不是极坐标本身.
我的意思是, 向量 $polar(r,theta)$
是向量 $(r cos theta, r sin theta)$ 的简写.

== 向量的几何属性

=== 大小和方向

#mbox[
  对于向量 $aa = (a_1, a_2, ..., a_n)$,
  将它看成空间中的平移量,
  平移的距离就是向量 $aa$ 的*大小*,
  也称*长度*或*模长*,
  记作 $abs(aa)$.

  向量 $aa$ 的大小表示为
  $abs(aa) = sqrt(a_1^2 + a_2^2 + dots.c + a_n^2)$,
  这是勾股定理在 $n$ 维空间的推广.

  把 $aa$ 看成空间中的平移量,
  平移的方向就是 $aa$ 的*方向*.
  对于平面向量, 可以用平移的方向角来表示向量的方向,
  记作 $angle(aa)$.
  显然地, $angle(aa) = angle(a_1,a_2)$.

  不过对于其他的维度, 我们其实一般是用向量来表示空间中的方向的,
  所以一个向量的方向可以用该向量本身来表示......
  或者用其他方向相同的向量来表示.
]

大小为0的向量, 或者说各分量都为0的向量,
称为*零向量*, 我们仍然用0表示,
或者你不嫌麻烦的话, $arrow(0)$.

#mbox(title: [平面向量的夹角])[
  对于两个非零的平面向量 $rr_1, rr_2$,
  将 $rr_2$ 和 $rr_1$ 的方向角的差值
  $angle(rr_2) - angle(rr_1)$
  称为 $rr_1,rr_2$ 的*夹角*, 记作
  $angle(rr_1,rr_2)$.
  规定夹角的范围为 $-180degree < dot <= 180degree$.

  LuaSTG有一个函数可以计算这个夹角.
  设 $rr_1$ 的方向角为 `a`, $rr_2$ 的方向角为 `b`,
  调用 `sp.math.subAngle(a,b)` 可以计算 $angle(rr_1,rr_2)$.
]

=== 相等和相反

#mbox(title: [向量相等])[
  如果两个向量的维数相等, 且*各分量对应相等*,
  那么这两个向量*相等*.

  另一方面, 如果两个向量的维数相等,
  且*大小相等, 方向相同*,
  那么这两个向量相等.
  这两个定义是等价的.
]
#mbox(title: [相反向量])[
  相反向量是相反数在高维的推广.

  如果两个向量 $aa, bb$
  维数相等, 且各分量对应互为相反数,
  那么这两个向量互为相反向量,
  记作 $aa = -bb$.

  另一方面, 如果两个向量的维数相等,
  且大小相等, 方向相反,
  那么这两个向量互为相反向量,
  这两个定义是等价的.
]

对于空间中的两点 $A, B$,
总有 $A = O A$, $A B = - B A$.

=== 平行 (共线) 与垂直

#mbox[
  对于两个非零向量, 如果它们的方向相互平行/垂直,
  就称这两个向量相互平行/垂直.

  规定零向量与任意向量平行/垂直.

  沿用直线平行与垂直的记号,
  向量 $aa, bb$ 平行记作
  $aa parallel bb$;
  向量 $aa, bb$ 垂直记作
  $aa bot bb$.
]

向量不关心平移的起点和终点,
只关心平移的距离和方向,
所以平行和共线对向量而言完全没有区别.

#figure(
  caption: [平行和共线],
  cetz.canvas({
    import cetz.draw: *
    let (A, C) = ((0, 0), (2, -0.5))
    let ang = 15deg
    let B = (rel: (ang, 2), to: A)
    let D = (rel: (ang, 1), to: C)
    let E = (rel: (ang, 3), to: A)
    let F = (rel: (ang, 1), to: E)

    line(A, B, mark: (end: "straight"))
    line(C, D, mark: (end: "straight"))
    line(E, F, mark: (end: "straight"))

    mcontent(A, $A$, north)
    mcontent(B, $B$, north)
    mcontent(C, $C$, north)
    mcontent(D, $D$, north)
    mcontent(E, $E$, north)
    mcontent(F, $F$, north)
  }),
) <parallel>

== 向量的线性运算

所谓线性运算, 指的是*加法*运算和*数乘*运算.
基本上只要提到 "线性", 就离不开这两种运算.

#mbox(title: [向量加法])[
  设向量 $aa = (a_1,...,a_n),
    bb = (b_1,...,b_n)$,
  两个向量的加法记作 $aa + bb$,
  计算方法为
  $ aa+bb = (a_1+b_1,...,a_n+b_n). $

  向量加法可以对应平移量的叠加.
  如@add 所示, 将向量 $aa,bb,cc$
  对应的平移量叠加在一起,
  得到的平移量 $dd$ 就是这三个向量的和.

  #figure(
    caption: [向量加法],
    cetz.canvas({
      import cetz.draw: *
      set-style(mark: (end: "straight"))
      line((0, 0), (rel: (1.5, 1.5)), name: "a")
      line((), (rel: (0.3, -3)), name: "b")
      line((), (rel: (2, 1.5)), name: "c")
      set-style(mark: (end: none))
      line(
        (),
        (0, 0),
        mark: (start: "straight"),
        stroke: (dash: "dashed"),
        name: "d",
      )
      mcontent("a.50%", $aa$, north-west)
      mcontent("b.40%", $bb$, north-east)
      mcontent("c.50%", $cc$, south-east)
      mcontent(
        "d.start",
        $dd = aa + bb + cc$,
        north,
      )
    }),
  ) <add>
]

#mbox(title: [向量减法])[
  向量减法 $aa - bb$ 等同于 $aa$ 加上 $bb$ 的相反向量.
  @sub 展示了 $aa - bb$ 的几何意义.

  设 $aa$ 对应点为 $A$, $bb$ 对应点为 $B$,
  则 $aa - bb$ 对应平移量 $B A$.

  #figure(
    caption: [向量减法],
    cetz.canvas({
      import cetz.draw: *
      let a = (2, 1)
      let b = (3, -1)
      set-style(mark: (end: "straight"))
      line((0, 0), a, name: "a")
      line((0, 0), b, name: "b")
      line(b, a, stroke: (dash: "dashed"), name: "c")
      mcontent("a.50%", $aa$, north)
      mcontent("b.50%", $bb$, south-west)
      mcontent("c.50%", $aa - bb$, north-east)
      mcontent((0, 0), $O$, west)
      mcontent(a, $A$, north)
      mcontent(b, $B$, east)
    }),
  ) <sub>
]

#mbox(title: [向量数乘])[
  向量 $aa = (a_1,...,a_n)$ 和实数 $lambda$
  的数乘运算记作 $lambda dot aa$,
  乘号 "$dot$" 可以省略, 即记作 $lambda aa$.
  计算方法为
  $ lambda aa = (lambda a_1, ..., lambda a_n). $

  向量数乘可以对应平移量的伸缩.
  $aa$ 和 $lambda aa$ 是平行的, 并且
  - $lambda aa$ 的大小是 $aa$ 的 $abs(lambda)$ 倍,
    即 $abs(lambda aa) = abs(lambda) abs(aa)$;
  - $lambda > 0$ 时, $aa$ 与 $lambda aa$ 方向相同;
    $lambda < 0$ 时, $aa$ 与 $lambda aa$ 方向相反;

  #figure(
    caption: [向量数乘],
    cetz.canvas({
      import cetz.draw: *
      let x = 1.5
      set-style(line: (mark: (end: "straight")))
      let ratio = range(-2, 3)
      let comment = ($-2aa$, $-aa$, $0$, $aa$, $2aa$)
      for i in range(5) {
        let k = ratio.at(i) * x
        // 图形
        if k == 0 {
          point((0, 0))
        } else {
          line((0, 0), (k, 0))
        }
        // 标注
        mcontent((k, 0), comment.at(i), north, padding: 1.5mm)
      }
    }),
  )
]

数乘运算与向量平行 (共线) 有着紧密的联系:
#mbox[
  设 $aa,bb$ 是非零向量, 则
  $aa parallel bb$
  等价于存在实数 $lambda != 0$
  使得 $aa = lambda bb$.
]

== 线性插值问题

线性插值问题是线性运算的一个重要应用,
该问题讨论如何根据直线上的两个已知点,
构造直线上其他点的坐标.

#mbox(title: [线性插值])[
  如@interpolation 所示,
  设有两个不重合的点 $A,B$ 以及另一个点 $C$.

  点 $C$ 在直线 $A B$ 上,
  等价于存在实数 $a,b$ 使得 $a + b = 1$ 且
  $ C = a A + b B. $

  #let a = 0.7
  #figure(
    caption: [线性插值 ($a = #a$)],
    cetz.canvas({
      import cetz.draw: *
      let (O, A, B) = ((0, 0), (-1, 3), (3, 2))
      let C = {
        let ((ax, ay), (bx, by)) = (A, B)
        (a * ax + (1 - a) * bx, a * ay + (1 - a) * by)
      }
      point(O, A, B, C)
      line(A, B)
      for P in (A, B, C) {
        line(O, P, mark: (end: "straight"))
      }
      mcontent(O, $O$, south-west)
      mcontent(A, $A$, west)
      mcontent(B, $B$, east)
      mcontent(C, $C = a A + b B$, east, fill: box-gray)
    }),
  ) <interpolation>

  特别地, 如果限制 $0<=a<=1$ (或者 $0<=b<=1$),
  则点 $C$ 在线段 $A B$ 上.
]

简单证明一下:
#mbox[
  + 如果 $C$ 在直线 $A B$ 上,
    那么 $A B$ 与 $A C$ 共线,
    有 $A C = lambda A B$.
    代入 $A C = C - A$, $A B = B - A$, 得到
    $ C = (1-lambda) A + lambda B. $
    令 $a=1-lambda, b=lambda$, 即得
    $a+b=1$, $C = a A + b B$.
  + 如果存在 $a+b=1$ 使得 $C = a A + b B$,
    可以得到
    $ A C = b A B, $
    所以 $A C$ 和 $A B$ 共线,
    点 $C$ 在直线 $A B$ 上.
]

== 平面向量的内积和外积

通常我们不讨论两个向量的乘法,
尽管可以写 $aa * bb = (a_1 b_1, ..., a_n b_n)$,
但这样的乘法不具有良好的几何意义,
导致其实用性很低.

接下来我们介绍*平面向量*的*内积*和*外积*,
它们有类似乘法的性质, 重要的是它们具有良好的几何意义.

=== 内积

#mbox[
  设两个平面向量 $rr_1 = (x_1, y_1)$,
  $rr_2 = (x_2, y_2)$.
  则 $rr_1, rr_2$ 的内积记作
  $rr_1 dot rr_2$,
  乘号 "$dot$" 不能省略.
  内积的结果是一个数
  $ rr_1 dot rr_2 = x_1 x_2 + y_1 y_2. $
]

尽管不是很直观,
但内积确实有良好的几何意义:

#mbox(title: [内积的几何意义])[
  设有平面向量 $rr_1, rr_2$,
  夹角 $angle(rr_1, rr_2) = theta$
  ($-180degree < theta <= 180degree$).
  则内积
  $
    rr_1 dot rr_2 =
    abs(rr_1) abs(rr_2) cos theta.
  $
]
证明: 用极坐标表示
$rr_1 = polar(r_1, theta_1)$,
$rr_2 = polar(r_2, theta_2)$,
则有
$
  rr_1 dot rr_2
  & = x_1 x_2 + y_1 y_2 \
  & = (r_1 cos theta_1)(r_2 cos theta_2)
  + (r_1 sin theta_1)(r_2 sin theta_2) \
  & = r_1 r_2 (cos theta_1 cos theta_2
    + sin theta_1 sin theta_2) \
  & = r_1 r_2 cos(theta_2 - theta_1)
  & (#raw(ex-3)) \
  & = r_1 r_2 cos theta.
  & (theta = angle(rr_2) - angle(rr_1))
$

内积可以用来表示向量长度.
设 $rr = (x, y)$,
那么 $rr dot rr = x^2 + y^2 = abs(rr)^2$.

由于内积与向量夹角的密切关系,
我们经常用内积来

- 判断垂直关系:
  设有两个平面向量 $rr_1, rr_2$.
  垂直关系 $rr_1 bot rr_2$
  等价于 $rr_1 dot rr_2 = 0$.
- 计算投影长度:
  如@projection 所示, 向量
  $rr_1$ 在 $rr_2$ 方向上的投影长度为
  $
    abs(rr_1) abs(cos theta) =
    abs(rr_1 dot rr_2) / abs(rr_2).
  $

#figure(caption: [投影])[
  #cetz.canvas({
    import cetz.draw: *
    let O = (0, 0)
    let (r1, r2, a) = (3, 3, 63deg)
    let proj = (r1 * calc.cos(a), 0)
    line(proj, (a, r1), stroke: (dash: "dashed"))
    set-style(line: (mark: (end: "straight")))
    line(O, (a, r1))
    line(O, proj)
    line(O, (r2, 0))
    mcontent((a, r1), $rr_1$, east)
    mcontent((r2, 0), $rr_2$, north)
    arc((3mm, 0), radius: 3mm, start: 0deg, stop: a, name: "arc")
    mcontent("arc", $theta$, north-east)
  })
] <projection>

=== 外积

#mbox[
  设两个平面向量 $rr_1, rr_2$.
  则 $rr_1, rr_2$ 的外积记作
  $rr_1 times rr_2$,
  乘号 "$times$" 不能省略.
  外积的结果是一个数
  $ rr_1 times rr_2 = x_1 y_2 - x_2 y_1. $
]

外积同样与向量夹角有关.
仿照内积的方法可以证明:
#mbox(title: [外积的几何意义])[
  设平面向量 $rr_1, rr_2$
  的夹角 $angle(rr_1, rr_2) = theta$
  ($-180degree < theta <= theta$).
  则外积
  $
    rr_1 times rr_2 =
    abs(rr_1) abs(rr_2) sin theta.
  $
]

外积可以用来判断平行关系.
$rr_1 parallel rr_2$ 等价于
$rr_1 times rr_2 = 0$.

外积还可以用于计算点到直线的距离.
如@dist 所示, 点 $P$ 到直线 $A B$ 的距离
$d = abs(A P) abs(sin theta)$,
于是可以表示为向量外积
$
  d = abs(A times B) / abs(A).
$

#figure(
  caption: [点到直线的距离],
  cetz.canvas({
    import cetz.draw: *
    let (r1, r2, a) = (3, 3, 36deg)
    let proj = r1 * calc.cos(a)
    let A = (0, 0)
    let B = (r2, 0)
    let P = (a, r1)
    line(P, (proj, 0), name: "dist")
    set-style(mark: (end: "straight"))
    line(A, B)
    line(A, P, stroke: (dash: "dashed"))
    mcontent(A, $A$, west)
    mcontent(B, $B$, east)
    mcontent(P, $P$, east)
    mcontent("dist.50%", $d$, east)
    set-style(mark: none)
    let s = 4mm
    arc((s, 0), radius: s, start: 0deg, stop: a)
    mcontent((a * .5, s * 1.5), $theta$, none)
  }),
) <dist>

#conclude[
  - 用点和平移量表示向量
  - 线性插值问题
  - 内积, 外积与向量夹角的关系
  - 用内积和外积判断平行和垂直
][
  + 举例说明: 对于平面向量 $rr_1, rr_2$,
    $abs(rr_1) + abs(rr_2)$ 和
    $abs(rr_1 + rr_2)$ 不一定相等.
    试说明满足什么条件时, 有
    $abs(rr_1)+abs(rr_2) = abs(rr_1+rr_2)$?

  + 已知平面上不重合的两点
    $A=(x_1,y_1), B=(x_2,y_2)$,
    求线段 $A B$ 的两个三等分点的坐标.

  + 证明: $abs(rr_1 dot rr_2)^2
    + abs(rr_1 times rr_2)^2
    = abs(rr_1)^2 abs(rr_2)^2$.
    (提示: 内积和外积的几何意义)

  + 如下图, 已知直线上两点 $A,B$,
    直线的方向向量 $A B = arrow(s)$.
    对于平面上的一点 $P$,
    如何判断点 $P$ 位于直线 $A B$ 的哪一侧?

    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        let (A, B, P) = ((0, 0), (5, -1), (2.7, 0.5))
        line(A, B, name: "l")
        point("l.30%", "l.70%", P)
        mcontent("l.28%", $A$, south, padding: 1.5mm)
        mcontent("l.69%", $B$, south, padding: 1.5mm)
        mcontent(P, $P$, east)
        line(
          "l.30%",
          "l.70%",
          mark: (end: "straight"),
          stroke: 1.5pt,
          name: "s",
        )
        mcontent("s.50%", $arrow(s)$, north)
      }),
    )

  + #titlize[较难]
    如下图, 已知平面上一个三角形的三个顶点 $A,B,C$.
    当平面上的点 $P$ 满足什么条件时,
    可以断定点 $P$ 在三角形 $A B C$ 内部?
    // (提示: 利用上一题的结论)

    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        let (A, B, C) = ((0, 0), (3, 0.5), (2, 2))
        let P = (1.8, 0.8)
        line(close: true, A, B, C, fill: box-gray)
        point(A, B, C, P)
        mcontent(A, $A$, west)
        mcontent(B, $B$, east)
        mcontent(C, $C$, north)
        mcontent(P, $P$, east)
      }),
    )
]
