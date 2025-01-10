#import "../template.typ": *
#show: content => math-tutorial(content)

= #s1-2

== 向量的引入

我们经常用数值来描述实际事物的特征,
如长度, 温度, 价格等.
这是因为数值的加减乘除,
比较大小等运算可以用来描述这些特征的各类变化.

在平面上有很多特征无法用单个数值来描述,
比如*坐标*, *速度*, *平移量*等.
我们察觉到这些特征具有极为相似的表示方法,
因此我们引入*向量*的概念来更好地描述它们.

我们在理解向量时容易遇到困难, 这是因为
+ 我们对向量从多种视角作*多个定义*, 这些定义看起来相互独立,
  但它们确实都描述同一个对象;
+ 向量的同一种运算在不同的定义上有各自不同的含义,
  但它们确实都表示同一运算.

首先我们预览一下向量在不同视角的意义,
然后对各个视角分别讨论.
+ 计算视角: 向量是若干个数值组成的*列表*.
+ 几何视角: 向量是空间中具有*长度*和*方向*的箭头,
  但将箭头*平移不影响向量的取值*.
+ 抽象视角: 向量是具有*加法*和*数乘*运算的代数结构.

== 各个视角下的向量

#definition([向量, 计算视角])[
  对于实数 $a_1,a_2,...,a_n$,
  将列表 $(a_1,a_2,...,a_n)$
  称为一个 *$n$ 维向量*.
  其中, $n$ 称为该向量的*维数*,
  $a_1,a_2,...,a_n$ 称为该向量在各维度的*分量*.
]

我们用字母指代一个数值时,
通常使用小写英文字母
(如 $a,b,x,y,z$) 和希腊字母
(如 $alpha,beta,theta$),
这些字母在我们指代向量时也经常使用.
为了加以区分,
可以在指代向量的字母上方加一个箭头,
如 $ arrow(r) = (3,4) $
表示一个向量 $arrow(r)$,
该向量的值为 $(3,4)$.

#definition([向量, 几何视角])[
  如@geo-def,
  设平面直角坐标系中有两点 $A,B$,
  将从 $A$ 到 $B$ 的*平移量*称为向量 $A B$,
  用从 $A$ 到 $B$ 的单向箭头表示.

  #figure(caption: [向量 $A B$])[
    #cetz.canvas({
      import cetz.draw: *
      let (A, B) = ((0, 0), (-3, -1))
      line(A, B, mark: (end: "straight"))
      point(A)
      point(B)
      mcontent(A, $A$, east)
      mcontent(B, $B$, west, pad: 1.5mm)
    })
  ] <geo-def>

  向量的*维数*就是它所在空间的维数.
  通常我们讨论的都是平面, 也就是二维空间的向量,
  我们称之为*平面向量*.
]

我们只关心向量的*长度*和*方向*,
只要两个向量的长度和方向都相同,
即使这两个向量的*起点和终点不同*,
我们也认为这两个向量是相等的.

平面上的点 $P$ 可以看作原点到该点的平移量,
所以我们也可以把点 $P$ 称为向量 $P$
(简略地说, $P := O P$).

#definition([向量, 抽象视角])[
  抽象视角下的向量比我们平时讨论的向量概念更加宽泛,
  只要一个东西支持*加法*运算和*数乘*运算那么它就是向量
  (当然, 前提是加法运算要满足加法的性质, 数乘运算同理).
]

向量的核心是*加法*运算和*数乘*运算.
这两种运算我们统称*线性*运算,
之后会做详细介绍.

在讨论向量的属性和运算时,
我们需要同时关注几何上的意义以及实际计算的方法.

== 向量的几何属性

=== 大小和方向

#definition[
  将向量 $arrow(r)$ 视为空间中的一个平移量 (几何视角),
  平移的距离就是向量 $arrow(r)$ 的*大小*,
  也称*长度*或*模长*, 记作 $abs(arrow(r))$;
  平移的方向就是向量 $arrow(r)$ 的*方向*,
  对于*平面向量*, 向量的方向可以用平移的*方向角*来表示,
  记作 $angle(arrow(r))$.

  大小为1的向量称为*单位向量*.
  大小为0的向量称为*零向量*,
  仍记作0.

  设两个大小不为0的*平面向量* $rr_1, rr_2$.
  将 $rr_2$ 和 $rr_1$
  方向的差值称为 $rr_1, rr_2$
  的*夹角*, 记作
  $angle(rr_1, rr_2)
  equiv angle(rr_2) - angle(rr_1)$.
  规定夹角的大小范围为 $-180degree < theta <= 180degree$.
]

对于平面向量 $arrow(r) = (x, y)$,
$arrow(r)$ 的大小 $abs(arrow(r)) = sqrt(x^2 + y^2)$,
方向 $angle(arrow(r)) = angle(x, y)$.

=== 相等向量和相反向量
#definition("相等向量")[
  对于向量
  $arrow(a) = (a_1,a_2,...,a_n),
  arrow(b) = (b_1,b_2,...,b_n)$,
  如果两向量的*大小相等, 方向相同*,
  那么我们说这两个向量*相等*.

  另一个角度, 如果两向量的*各分量对应相等*,
  即 $a_i=b_i$ ($i=1,2,...,n$),
  那么两向量相等. 这两个定义是等价的.
]
#definition("相反向量")[
  对于向量
  $arrow(a) = (a_1,a_2,...,a_n),
  arrow(b) = (b_1,b_2,...,b_n)$,
  如果两向量的*大小相等, 方向相反*,
  那么我们说这两个向量是一对*相反向量*.
  $arrow(a)$ 的相反向量记作 $-arrow(a)$.

  另一个角度, 如果两向量的*各分量对应为相反数*,
  即 $a_i=-b_i$ ($i=1,2,...,n$),
  那么两向量是一对相反向量.
]
对于空间中的两点 $A,B$,
向量 $A B$ 和 $B A$ 总是一对相反向量.
=== 平行 (共线), 垂直
#definition("向量垂直")[
  如果两个非零向量 $arrow(a), arrow(b)$
  的*方向互相垂直*,
  就称这两个向量互相*垂直*,
  记作 $arrow(a) bot arrow(b)$.

  规定零向量与任意向量垂直.
]
#definition("向量平行")[
  如果两个非零向量 $arrow(a), arrow(b)$
  的*方向相同或相反*,
  就称这两个向量互相*平行*或*共线*,
  记作 $arrow(a) parallel arrow(b)$.

  规定零向量与任意向量平行.
]

平行和共线本来是不同的概念, 例如在@parallel 中,
线段 $A B$ 和线段 $C D$ 是平行,
而线段 $A B$ 和线段 $E F$ 是共线.
但是将向量平移不会影响向量的值,
所以对于向量而言, 平行和共线没有区别.

#figure(caption: [平行和共线])[
  #cetz.canvas({
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
  })
] <parallel>

== 向量的线性运算

#definition("向量的加法")[
  对于向量 $arrow(a) = (a_1, a_2, ..., a_n),
  arrow(b) = (b_1, b_2, ..., b_n)$,
  向量 $arrow(a), arrow(b)$ 的加法记作 $arrow(a)+arrow(b)$.

  计算方法是把各个分量对应相加, 即
  $arrow(a) + arrow(b) = (a_1+b_1, ..., a_n+b_n)$.
]

几何上, 向量的加法可以看作对应平移量的共同作用.
如@add 所示, 将向量 $arrow(a), arrow(b), arrow(c)$
对应的平移量依此作用到原点 $O$ 上,
终点对应的向量 $arrow(d)$ 即为这三个向量的和.

#figure(caption: [向量的加法])[
  #cetz.canvas({
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
    mcontent((0, 0), $O$, west)
    mcontent("a.50%", $arrow(a)$, north-west)
    mcontent("b.40%", $arrow(b)$, north-east)
    mcontent("c.50%", $arrow(c)$, south-east)
    mcontent(
      "d.start",
      $arrow(d) = arrow(a) + arrow(b) + arrow(c)$,
      east,
    )
  })
] <add>

类似地可以定义向量的减法 $arrow(a) - arrow(b)$,
这就是 $arrow(a)$ 加上 $arrow(b)$ 的相反向量.

值得注意的是, 对于任意两点 $A B$,
有向量减法 $A B = B - A$.

#definition("向量的数乘")[
  对于向量 $arrow(a) = (a_1, a_2, ..., a_n)$
  和实数 $lambda$,
  向量 $arrow(a)$ 和数 $lambda$ 的数乘记作
  $lambda dot arrow(a)$,
  乘号 "$dot$" 可以省略.

  计算方法是把 $lambda$ 和各个分量相乘, 即
  $lambda arrow(a) = (lambda a_1, ..., lambda a_n)$.
]

几何上, 向量 $arrow(a)$ 与数 $lambda$ 的数乘
$lambda arrow(a)$ 总是一个与
$arrow(a)$ 共线的向量.
- $lambda arrow(a)$ 的大小是 $arrow(a)$ 的大小的
  $abs(lambda)$ 倍, 即
  $abs(lambda arrow(a)) = abs(lambda) abs(arrow(a))$;
- $lambda>0$ 时, $arrow(a)$ 与 $lambda arrow(a)$ 方向相同;
  $lambda<0$ 时, $arrow(a)$ 与 $lambda arrow(a)$ 方向相反.

#figure(caption: [向量的数乘])[
  #cetz.canvas({
    import cetz.draw: *
    let O = (0, 0)
    let x = 1.5
    set-style(line: (mark: (end: "straight")))
    point(O)
    for k in range(-2, 2 + 1) {
      if k == 0 { continue }
      line((0, 0), (k * x, 0))
    }
    mcontent(O, $O$, north, pad: 1.5mm)
    mcontent((x, 0), $arrow(a)$, north-west, pad: 1.5mm)
    mcontent((x * 2, 0), $2 arrow(a)$, north-west, pad: 1.5mm)
    mcontent((-x, 0), $-arrow(a)$, north-east, pad: 1.5mm)
    mcontent((-x * 2, 0), $-2 arrow(a)$, north-east, pad: 1.5mm)
  })
]

我们看到, 数乘运算与向量平行 (共线) 有着紧密的联系:
#theorem[
  对于非零向量 $arrow(a), arrow(b)$,
  $arrow(a) parallel arrow(b)$
  等价于存在实数 $lambda != 0$
  使得 $arrow(a) = lambda arrow(b)$.
]

== 线性运算的应用: 线性插值问题

线性插值问题讨论如何根据已知的两点坐标,
求出直线上其他点的坐标.

#theorem("线性插值")[
  如图, 设空间中有两个不重合的点 $A, B$
  以及另一个点 $C$,
  它们对应的向量仍记作 $A, B, C$.

  那么, 点 $C$ 在直线 $A B$ 上, 等价于存在实数 $a,b$
  使得 $a+b=1$ 且
  $ C = a A + b B. $

  #let a = 0.3
  #figure(
    caption: [线性插值 ($a = #a$)],
    {
      cetz.canvas({
        import cetz.draw: *
        let O = (0, 0)
        let A = (-1, 3)
        let B = (3, 2)
        let C = (
          a * A.at(0) + (1 - a) * B.at(0),
          a * A.at(1) + (1 - a) * B.at(1),
        )
        point(O)
        line(A, B)
        set-style(line: (mark: (end: "straight")))
        for P in (A, B, C) {
          point(P)
          line(O, P)
        }
        mcontent(O, $O$, south-west)
        mcontent(A, $A$, west)
        mcontent(B, $B$, east)
        mcontent(
          C,
          box(
            $
              C = a A + (1-a) B
            $,
            fill: box-gray,
          ),
          north,
        )
      })
    },
  ) <interpolation>
]
#proof[
  #enum(
    enum.item[
      如果 $C$ 在直线 $A B$ 上,
      那么 $A B$ 与 $A C$ 共线,
      有 $A C = lambda A B$.
      代入 $A C = C - A$, $A B = B - A$, 得到
      $ C = (1-lambda) A + lambda B. $
      令 $a=1-lambda, b=lambda$, 即得
      $a+b=1$, $C = a A + b B$.
    ],
    enum.item[
      如果存在 $a+b=1$ 使得 $C = a A + b B$,
      可以得到
      $ A C = b A B, $
      所以 $A C$ 和 $A B$ 共线,
      点 $C$ 在直线 $A B$ 上.
    ],
  )
]

特别地, 如果限制 $0 <= a <= 1$ (或者 $0 <= b <= 1$),
可以得到线段 $A B$ 上的点.

== 平面向量的 #strike("乘法") 内积和外积

尽管我们可以定义两个向量的乘法,
比如 $arrow(a) * arrow(b) = (a_1 b_1, ..., a_n b_n)$,
但这样的乘法不具有良好的实用意义
(主要是几何意义).

接下来我们介绍*平面向量*的*内积*和*外积*运算,
它们具有良好的几何意义,
并且有着类似乘法的性质.

#definition("平面向量的内积")[
  设两个平面向量 $rr_1 = (x_1, y_1)$,
  $rr_2 = (x_2, y_2)$,
  向量 $rr_1, rr_2$
  的*内积*是一个数, 记作 $rr_1 dot rr_2$,
  乘号 "$dot$" 不能省略.
  内积的结果为
  $ rr_1 dot rr_2 := x_1 x_2 + y_1 y_2. $
]

尽管不是很直观,
内积确实有良好的几何意义:

#theorem("内积的几何意义")[
  对于平面上的两个向量 $rr_1, rr_2$,
  设夹角 $angle(rr_1, rr_2) = theta$
  ($-180degree < theta <= 180degree$).
  则内积
  $
    rr_1 dot rr_2 =
    abs(rr_1) abs(rr_2) cos theta.
  $
]
#proof[
  用极坐标表示 $rr_1 = polar(r_1, theta_1)$,
  $rr_2 = polar(r_2, theta_2)$, 则有
  $
    rr_1 dot rr_2
    & = x_1 x_2 + y_1 y_2 \
    & = (r_1 cos theta_1)(r_2 cos theta_2)
    + (r_1 sin theta_1)(r_2 sin theta_2) \
    & = r_1 r_2 (cos theta_1 cos theta_2
      + sin theta_1 sin theta_2) \
    & = r_1 r_2 cos(theta_2 - theta_1)
    & (见 #`EX.3 三角函数公式`) \
    & = r_1 r_2 cos theta
    & (theta = angle(rr_2) - angle(rr_1)).
  $
]

特别地, 当 $rr_1 = rr_2 = arrow(r)$ 时,
$arrow(r) dot arrow(r) = abs(arrow(r))^2$.

另一个特殊情况是, 当 $rr_1, rr_2$ 相互垂直,
即 $theta = pm 90degree$ 时,
$cos theta = 0$, 所以 $rr_1 dot rr_2 = 0$.
这是判断两个向量是否垂直的常用方法.

#theorem[向量垂直判定条件][
  $rr_1 bot rr_2$ 等价于
  $rr_1 dot rr_2 = 0$.
]

内积还与投影有关. 如@projection 所示,
向量 $rr_1$ 在 $rr_2$ 方向上的投影长度为
$
  abs(rr_1) abs(cos theta) =
  abs(rr_1 dot rr_2) / abs(rr_2).
$

#figure(caption: [向量的投影])[
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

#definition[平面向量的外积][
  两个平面向量 $rr_1 = (x_1, y_1)$,
  $rr_2 = (x_2, y_2)$ 的*外积*也是一个数,
  记作 $rr_1 times rr_2$,
  乘号 "$times$" 不能省略.
  外积的结果为
  $ rr_1 times rr_2 = x_1 y_2 - x_2 y_1. $
]

外积的几何意义同样与夹角有关.
仿照内积的方法可以证明:

#theorem[外积的几何意义][
  对于平面上的两个向量 $rr_1, rr_2$,
  设夹角 $angle(rr_1, rr_2) = theta$
  ($-180degree < theta <= 180degree$).
  则外积
  $
    rr_1 times rr_2 =
    abs(rr_1) abs(rr_2) sin theta.
  $
]

注意, 调换 $rr_1, rr_2$ 的顺序后,
夹角会变为相反数, 外积结果也会随之变为相反数, 即
$rr_1 times rr_2 =
  -rr_2 times rr_1$.

当 $rr_1, rr_2$ 的方向相同或相反时,
$sin theta = 0$, $rr_1, rr_2$
的外积为0. 所以外积可以用来判定向量平行.

#theorem[向量平行判定条件][
  $rr_1 parallel rr_2$
  等价于 $rr_1 times rr_2 = 0$.
]

外积还可以用于求解点到直线的距离.
如@dist 所示, 点 $A$ 到直线 $O B$ 的距离
$d = abs(O A) abs(sin theta)$,
于是可以表示为向量外积
$
  d = abs(A times B) / abs(A). 
$

#figure(caption: [点到直线的距离])[
  #cetz.canvas({
    import cetz.draw: *
    let O = (0, 0)
    let (r1, r2, a) = (3, 3, 36deg)
    let proj = (r1 * calc.cos(a), 0)
    line(
      O,
      (a, r1),
      stroke: (dash: "dashed"),
      mark: (end: "straight"),
    )
    line(O, (r2, 0), mark: (end: "straight"))
    line((a, r1), proj, name: "dist")
    mcontent(O, $O$, west)
    mcontent((a, r1), $A$, east)
    mcontent((r2, 0), $B$, east)
    mcontent("dist.55%", $d$, east)
    arc((4mm, 0), radius: 4mm, start: 0deg, stop: a, name: "arc")
    mcontent("arc.60deg", $theta$, east, pad: 2mm)
  })
] <dist>

#conclude[]
