#import "../template.typ": *
#show: math-tutorial

= #s1-3

弹幕制作经常涉及到平移, 旋转, 缩放等变换,
这些基础的变换以及它们组合而得的变换有着怎样的共性?

拼弹里我们一般容易知道各子弹的相对位置,
如何将其转换为绝对坐标?

我个人更希望能用矩阵的观点来讲解这些问题,
但这样就要花大量篇幅介绍矩阵的很多基本概念,
只好暂且放弃.
如果你的条件允许, 我强烈推荐观看3B1B的视频
https://www.bilibili.com/video/BV1ys411472E

== 线性变换

空间中的*变换*将一个点变换到另一个点,
我们可以将其看作一个*函数*,
其自变量 (接收的参数) 和因变量 (返回的结果)
都是向量. 比如平面上的平移变换可以表示为
$
  f(x, y) = (x + Delta x, y + Delta y),
  quad (Delta x, Delta y) "为平移量",
$
或者表示为
$
  f(arrow(r)) = arrow(r) + Delta arrow(r),
  quad Delta arrow(r) := (Delta x, Delta y)
  "为平移量".
$

线性变换是一类特殊的变换:

#definition[线性变换][
  如果一个变换 $f(arrow(r))$ 满足:
  + 和的变换等于变换的和:
    对于定义域内任意 $rr_1, rr_2$, 有
    $ f(rr_1 + rr_2) = f(rr_1) + f(rr_2); $
  + 数乘的变换等于变换的数乘:
    对于定义域内任意 $arrow(r)$ 和任意实数 $lambda$, 有
    $ f(lambda arrow(r)) = lambda f(arrow(r)). $
  则我们说变换 $f$ 是*线性*的.
]

上述定义等价于:

#definition[线性变换][
  如果对于变换 $f(arrow(r))$,
  线性组合的变换等于变换的线性组合:

  对于定义域内任意 $rr_1, rr_2$
  和实数 $lambda_1, lambda_2$, 有
  $
    f(lambda_1 rr_1 + lambda_2 rr_2) =
    lambda_1 f(rr_1) + lambda_2 f(rr_2),
  $
  则 $f$ 是线性变换.
]

#example[
  缩放变换 $f(x, y) = (k_x x, k_y y)$.
  任取实数 $a, b$ 和向量
  $rr_1 = (x_1, y_1), rr_2 = (x_2, y_2)$,
  $
    f(a rr_1 + b rr_2)
    & = f(a x_1 + b x_2, a y_1 + b y_2) \
    & = (a k_x x_1 + b k_x x_2, a k_y y_1 + b k_y y_2),
  $
  $
    a f(rr_1) + b f(rr_2)
    & = a dot (k_x x_1, k_y y_1) + b dot (k_y y_1, k_y y_2) \
    & = (a k_x x_1 + b k_x x_2, a k_y y_1 + b k_y y_2).
  $
  所以 $f(a rr_1 + b rr_2) = a f(rr_1) + b f(rr_2)$,
  该变换是线性的.
]

类似地可以证明,
绕原点的旋转变换是线性的,
而平移变换是非线性的.

在进一步讨论线性变换之前,
我希望先引入仿射坐标系的概念.

== 仿射坐标系与平面基底

仿射坐标系的原理是平面向量基本定理:

#theorem[平面向量基本定理][
  在平面上给定*任意两个不共线的向量*
  $ee_1, ee_2$.
  对于该平面上任意向量 $rr$,
  都*存在唯一一组*实数 $a, b$, 使得
  $
    rr = a ee_1 + b ee_2.
  $
]

我们作图来说明该定理. 如@affine 所示,
$ee_1, ee_2$ 是两个不共线的平面向量,
$A$ 是平面上一点. 对于该平面上任意向量 $rr$,
作平行四边形 $A M P N$ 使得
$A P = rr$, $A M parallel ee_1$,
$A N parallel ee_2$.
于是存在实数 $a, b$ 使得
$A M = a ee_1, A N = b ee_2$.
由向量加法的几何意义,
有 $rr = a ee_1 + b ee_2$.

#figure(
  caption: [仿射坐标系 $(A; ee_1, ee_2)$],
  cetz.canvas({
    import cetz.draw: *
    let A = (0, 0)
    let (a, b, theta) = (2, 3, 70deg)
    let (e1, e2) = ((0deg, 1), (theta, 1))
    let (M, N) = ((0deg, a), (theta, b))
    let P = (rel: M, to: N)
    for x in (A, M, N, P) { point(x) }
    line(A, M, P, N, A, P, mark: (end: "straight"))
    mcontent(A, $A$, south-west)
    mcontent(M, $M$, south-east)
    mcontent(N, $N$, north-west)
    mcontent(P, $P$, north-east)
    for e in (e1, e2) {
      line(A, e, mark: (end: "straight"))
    }
    mcontent(e1, $ee_1$, south)
    mcontent(e2, $ee_2$, north-west)
    mcontent((A, 60%, P), $rr$, north-west)
  }),
) <affine>

#definition[仿射坐标系][
  如@affine 所示, 指定平面上一点 $A$
  和两个不共线向量 $ee_1, ee_2$.
  对于平面上任意一点 $P$,
  存在唯一一组实数 $a, b$ 使得
  $
    P = A + a ee_1 + b ee_2.
  $
  将 $A, ee_1, ee_2$ 构成的坐标系称为*仿射坐标系*,
  记作 $(A; ee_1, ee_2)$,

  将 $(a, b)$ 称为点 $P$ 在该坐标系下的*仿射坐标*.

  将 $(ee_1, ee_2)$ 称为该平面的一组*基底*,
  $(a, b)$ 称为向量 $rr = A P$ *在该基底下的坐标*.
]

平面直角坐标系是一个特殊的仿射坐标系, 记作 $(O; ii, jj)$,
其中 $ii = (1,0), jj = (0,1)$.

设 $f$ 是一个线性变换,
$f$ 将向量 $rr = (x, y) = x ii + y jj$
变换为
$
  f(rr) = f(x ii + y jj)
  = x f(ii) + y f(jj).
$
$f$ 是一个确定的变换, 所以
$f(ii), f(jj)$ 是确定的. 设
$ff_1 = f(ii)$,
$ff_2 = f(jj)$,
那么

当 $rr$ 在基底 $(ii, jj)$ 下的坐标为 $(x, y)$ 时,
$f(rr)$ 在基底 $(ff_1, ff_2)$ 下的坐标为 $(x, y)$.

(当 $ff_1 parallel ff_2$ 时, $(ff_1, ff_2)$
不是平面的一组基底, 但上述数量关系仍成立.)

所以我们可以用 $ff_1, ff_2$
来表示线性变换 $f$,
记作 $
  f = (ff_1, ff_2).
$

== 仿射坐标系的坐标转换

#let cc = $arrow(c)$

接下来我们讨论平面直角坐标系 $(O; ii, jj)$
与仿射坐标系 $(A; ee_1, ee_2)$
之间的坐标转换.

对于仿射坐标系 $(A; ee_1, ee_2)$,
已知点 $A$ 和向量 $ee_1, ee_2$ 的直角坐标.
设平面上一点 $P$ 的直角坐标为 $rr = (x, y)$,
在仿射坐标系下坐标为 $cc = (a, b)$.

#set math.equation(numbering: "(1)", supplement: "式")
#enum[
  将仿射坐标 $cc$ 转换为直角坐标 $rr$ 是容易的.
  根据仿射坐标系的定义,
  $ rr = P = A + a ee_1 + b ee_2, $ <1>
  代入 $A, ee_1, ee_2$ 的直角坐标,
  即可得到点 $P$ 的直角坐标 $rr$.
][
  将直角坐标 $rr$ 转换为仿射坐标 $cc$ 是相对较难的.
  根据@1 有
  $ A P = a ee_1 + b ee_2, $ <2>
  其中 $A P = rr - A$ 容易求出.

  将@2 写成坐标形式, 可以发现@2 是一个关于 $a,b$
  的*二元一次方程组*, 方程组的解法本教程就不介绍了.

  我们也可以从线性变换的角度考虑.

  设线性变换 $f := (ee_1, ee_2) = ((e_1, e_2), (e_3, e_4))$,
  则@2 可以表示为 $A P = f(cc)$.
  只要能求出 $f$ 的*逆变换* $f^(-1)$,
  就可以计算出仿射坐标 $cc = f^(-1)(A P)$.

  我们可以验证, $f^(-1)$ 是一个线性变换
  #set math.equation(numbering: none)
  $
    f^(-1)(rr) = 1 / (e_1 e_4 - e_2 e_3) g(rr),
    quad g := ((e_4, -e_2), (-e_3, e_1)).
  $
]

// == 矩阵

// #definition[
//   一个*矩阵*表示为一个 $m$ 行 $n$ 列
//   ($m times n$) 的数值表格,
//   通常用大写英文字母来指代.
//   比如下面是一个 $3 times 4$ 矩阵:
//   $ A = mat(1,2,3,4; 5,6,7,8; 9,10,11,12). $

// 上面的矩阵 $A$ 也可以表示为
// $[1,2,3,4; 5,6,7,8; 9,10,11,12]$,
// 分号 ";" 表示换行.

//   如果矩阵的行数和列数都为 $n$,
//   则称该矩阵是一个 $n$ 阶*方阵*.

//   在讨论矩阵时, 我们把向量也写成矩阵的形式.
//   对于 $n$ 维向量 $arrow(a) = (a_1,a_2,...,a_n)$,
//   可以写成 $1 times n$ 的矩阵
//   $ mat(a_1, a_2, dots.c, a_n), $
//   称为*行矩阵*, 也可以写成 $n times 1$ 的矩阵
//   $ mat(a_1; a_2; dots.v; a_n), $
//   称为*列矩阵*.

//   默认将向量写成行矩阵还是列矩阵,
//   各个领域没有统一的规范.
//   本教程中用*列矩阵*来表示向量.
// ]

// 对于平面上的线性变换 $f = (ff_1, ff_2)$,
// 设 $ff_1 = (f_(11), f_(12))$,
// $ff_2 = (f_(21), f_(22))$,
// 我们可以将 $f$ 写成矩阵形式
// $
//   F = mat(ff_1, ff_2)
//   = mat(f_(11), f_(21); f_(12), f_(22)).
// $
// 特别地, $n$ 维空间上的恒等变换 $f(rr) = rr$
// 对应的矩阵为 $n$ 阶方阵
// $
//   mat(
//     1, 0, dots.c, 0, 0;
//     0, 1, dots.c, 0, 0;
//     dots.v, dots.v, dots.down, dots.v, dots.v;
//     0, 0, dots.c, 1, 0;
//     0, 0, dots.c, 0, 1;
//   ),
// $
// 称其为 $n$ 阶*单位矩阵*, 记作 $E_n$ 或 $E$.

// 在了解矩阵的运算后, 我们会看到用矩阵表示线性变换的

#conclude[]
