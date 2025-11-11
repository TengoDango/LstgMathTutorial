#import "template.typ": *
#show: math-tutorial

#show link: set text(font: "Libertinus Serif")

#outline(title: [目录]) <dir>
#let get-back = link(label("dir"))[返回目录]

#set enum(
  full: true,
  numbering: (..nums) => {
    let pattern = if nums.pos().len() == 1 {
      "1."
    } else { "(a)" }
    numbering(pattern, nums.pos().last())
  },
)

= #s1-1

+ 三角函数的简单运用, 没什么好说的.
  设点 $P$ 的直角坐标为 $(x_p, y_p)$, 则
  $
    x_p = x_0 + R cos alpha, \
    y_p = y_0 + R sin alpha. \
  $

+ $abs(A B)$ 由勾股定理可得,
  $
    abs(A B) = sqrt(
      (x_1 - x_2)^2 + (y_1 - y_2)^2
    ).
  $
  不过写弹幕的话不用写这么长的式子,
  直接 `Dist(x1, y1, x2, y2)` 就行.

  $angle(A B) = angle(x_2 - x_1, y_2 - y_1)$,
  类似地直接 `Angle(x1, y1, x2, y2)` 就行.

+ 考虑到点 $(cos theta, sin theta)$
  是单位圆上的点 (三角函数的定义),
  该点到原点的距离为1.
  由勾股定理可到
  $(cos theta)^2 + (sin theta)^2 = 1^2 = 1$.

+ + 判断直线和圆的位置关系,
    最重要的依据是圆心到直线的距离与圆半径的大小关系,
    当距离 $<=$ 半径时直线与圆相交.

    $O'$ 到 $x$ 轴的距离就是 $O'$ 纵坐标的绝对值
    $abs(L sin alpha)$

+ #text(fill: red, size: 6mm)[题目被更改]

  虽然好像有点超纲, 但反正这教程也不会讲初中的平面几何,
  所以就这样吧.

  + 判断直线和圆的位置关系,
    最重要的依据是圆心到直线的距离与圆半径的大小关系.
    当距离 $<=$ 半径时直线与圆相交.

    点 $O'$ 到直线 $O H$ 的距离可以利用三角函数求出.
    对于下图的简单情况, 这个距离是 $d = L sin alpha$.
    尝试其他的射线角度, 会发现需要取绝对值
    $ d = L abs(sin alpha). $

    所以当 $L abs(sin alpha) <= R$ 的时候,
    直线 $O H$ 与圆 $O'$ 相交,
    但这离射线与圆相交还稍微差一点.
    射线方向朝左时, 射线与圆 $O'$ 总是无法相交的,
    所以还需要添加一个条件
    $cos alpha > 0$.

    那么答案是: $L abs(sin alpha) <= R$
    且 $cos alpha > 0$.

    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        // 参数
        let L = 3
        let a = 16deg
        let (x0, y0) = (4.5, 2)
        // 锚点
        let h = L * calc.sin(a)
        let d = L * calc.cos(a)
        let O = (0, 0)
        let OO = (L, 0)
        let H = (a, d)
        point(O, OO, H)
        // 坐标轴
        line((-0.5, 0), (x0, 0), mark: (end: "straight"))
        line((0, -1), (0, y0), mark: (end: "straight"))
        mcontent((x0, 0), $x$, east)
        mcontent((0, y0), $y$, west)
        mcontent(O, $O$, south-west)
        // 射线与圆
        line(O, (a, d + 1))
        line(OO, H)
        mcontent(H, $H$, north, padding: 1.5mm)
        mcontent(OO, $O'$, south, padding: 2mm)
        mcontent((L / 2.0, 0), $L$, south)
        arc((1, 0), radius: 1, start: 0deg, stop: a)
        mcontent((a * 0.6, 1.2), $alpha$, none)
      }),
    )
    经典的错误:
    - 忘记 $cos alpha > 0$ 的条件;
    - 有些读者会想用角度范围来表示,
      形如 $abs(alpha) <= arcsin(R \/ L)$,
      但请不要忘记, 相差 $360degree$ 的两个角表示同一个方向.
      这时需要取 $alpha$ 除以 $360degree$
      的余数写出角度范围.

      比如, $abs((alpha + 180degree) mod 360degree - 180degree)
        <= arcsin(R \/ L)$.

  + 求 $abs(O A)$ 的主要思路是求出
    $abs(O H)$ 和 $abs(A H)$ 作差.

    由三角函数, $abs(O H) = L cos alpha$.

    由勾股定理,
    $abs(A H) = sqrt(abs(O'A)^2 - abs(O'H)^2)
      = sqrt(R^2 - (L sin alpha)^2)$.

    所以 $abs(O A) = L cos alpha
      - sqrt(R^2 - (L sin alpha)^2)$.

    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        // 参数
        let L = 4
        let R = 2
        let a = 16deg
        let (x0, y0) = (8, 2.5)
        // 锚点
        let h = L * calc.sin(a)
        let d = L * calc.cos(a)
        let dd = calc.sqrt(R * R - h * h)
        let O = (0, 0)
        let OO = (L, 0)
        let A = (a, d - dd)
        let B = (a, d + dd)
        let H = (a, d)
        point(O, OO, A, B, H)
        // 坐标轴
        line((-0.5, 0), (x0, 0), mark: (end: "straight"))
        line((0, -y0), (0, y0), mark: (end: "straight"))
        mcontent((x0, 0), $x$, east)
        mcontent((0, y0), $y$, west)
        mcontent(O, $O$, south-west)
        // 射线与圆
        circle(OO, radius: R)
        line(O, (a, d + dd + 1))
        line(A, OO, H)
        mcontent(A, $A$, north-west)
        mcontent(H, $H$, north, padding: 1.5mm)
        mcontent(B, $B$, north, padding: 2mm)
        mcontent(OO, $O'$, south, padding: 2mm)
      }),
    )

  + 对于下面这个比较简单的情况.
    仿照上一问可以算出
    $
      abs(O A) = abs(O H) + abs(A H)
      = L cos alpha + sqrt(
        R^2 - (L sin alpha)^2
      ).
    $
    可以验证这个结果对其他射线角度也是成立的.
    #align(
      center,
      cetz.canvas({
        import cetz.draw: *
        // 参数
        let L = 1
        let R = 2
        let a = 36deg
        let (x0, y0) = (4, 2.5)
        // 锚点
        let h = L * calc.sin(a)
        let d = L * calc.cos(a)
        let dd = calc.sqrt(R * R - h * h)
        let O = (0, 0)
        let OO = (L, 0)
        let A = (a, d + dd)
        let H = (a, d)
        point(O, OO, A, H)
        // 坐标轴
        line((-1.5, 0), (x0, 0), mark: (end: "straight"))
        line((0, -y0), (0, y0), mark: (end: "straight"))
        mcontent((x0, 0), $x$, east)
        mcontent((0, y0), $y$, west)
        mcontent(O, $O$, south-west)
        // 射线与圆
        circle(OO, radius: R)
        line(O, (a, d + dd + 1))
        line(A, OO, H)
        mcontent(A, $A$, north, padding: 2mm)
        mcontent(H, $H$, north, padding: 1.5mm)
        mcontent(OO, $O'$, south, padding: 2mm)
      }),
    )\


= #s1-2
= #s1-3

+ #titlize[方法一]
  考虑向量加法的几何意义.

  对于平面向量 $rr_1, rr_2$,
  令 $A B = rr_1, B C = rr_2$,
  则 $A C = rr_1 + rr_2$.

  #align(
    center,
    cetz.canvas({
      import cetz.draw: *
      // ABC
      let (A, B, C) = ((0, 0), (3, 0), (4, 1.5))
      point(A, B, C)
      mcontent(A, $A$, west)
      mcontent(B, $B$, east, padding: 1.5mm)
      mcontent(C, $C$, east)
      // vectors
      set-style(mark: (end: "straight"))
      line(A, B, name: "AB")
      line(B, C, name: "BC")
      line(A, C, name: "AC")
      mcontent("AB.50%", $rr_1$, south)
      mcontent("BC.48%", $rr_2$, east, padding: 2mm)
      mcontent("AC.60%", $rr_1+rr_2$, north-west)
    }),
  )

  这时问题就变成了
  $abs(A B) + abs(B C)$ 和
  $abs(A C)$ 的大小关系.

  - 当 $A B C$ 构成三角形时,
    三角形两边之和大于第三边,
    所以 $abs(rr_1) + abs(rr_2) > abs(rr_1 + rr_2)$.

  - $A B C$ 不构成三角形时,
    $A,B,C$ 三点共线.
    - 如果 $B$ 位于 $A,C$ 之间
      (即 $A B$ 与 $B C$ 同向)
      或 $A = B$ 或 $B = C$,
      则有 $abs(rr_1) + abs(rr_2) = abs(rr_1 + rr_2)$;
    - 否则有 $abs(A B) > abs(A C)$
      或 $abs(B C) > abs(A C)$,
      自然有 $abs(rr_1) + abs(rr_2) > abs(rr_1 + rr_2)$.

  结论:
  当且仅当 $rr_1, rr_2$ 方向相同时
  (规定零向量与任意向量方向相同),
  有 $abs(rr_1) + abs(rr_2) = abs(rr_1 + rr_2)$.

  #titlize[方法二]
  也可以考虑转化为内积,
  虽然这会让问题变难一些.

  比较 $abs(rr_1) + abs(rr_2)$
  和 $abs(rr_1 + rr_2)$ 的大小,
  等价于比较 $(abs(rr_1) + abs(rr_2))^2$
  和 $abs(rr_1 + rr_2)^2$ 的大小.
  $
    (abs(rr_1) + abs(rr_2))^2 - abs(rr_1 + rr_2)^2
    & = abs(rr_1)^2 + abs(rr_2)^2 + 2 abs(rr_1) abs(rr_2)
    - abs(rr_1 + rr_2)^2 \
    & = rr_1 dot rr_1 + rr_2 dot rr_2 + 2 abs(rr_1) abs(rr_2)
    - (rr_1 + rr_2) dot (rr_1 + rr_2) \
    & = 2 abs(rr_1) abs(rr_2) - 2 rr_1 dot rr_2 \
    & = 2 abs(rr_1) abs(rr_2) (1 - cos angle(rr_1, rr_2)) \
    & >= 0.
  $

  $(abs(rr_1) + abs(rr_2))^2 = abs(rr_1 + rr_2)^2$ 等价于
  $abs(rr_1) abs(rr_2) (1 - cos angle(rr_1, rr_2)) = 0$,
  即 $rr_1 = 0$ 或 $rr_2 = 0$ 或
  $angle(rr_1, rr_2) = 0degree$.

+ 如下图, $C, D$ 是线段 $A B$ 的三等分点.

  #align(
    center,
    cetz.canvas({
      import cetz.draw: *
      let (A, C, D, B) = ((0, 0), (1, 0), (2, 0), (3, 0))
      point(A, B, C, D)
      line(A, B)
      for (P, label) in ((A, $A$), (B, $B$), (C, $C$), (D, $D$)) {
        mcontent(P, label, south, padding: 1.5mm)
      }
    }),
  )

  由 $A, B$ 坐标可知
  $
    A C = 1 / 3 A B =
    ((x_2 - x_1) / 3, (y_2 - y_1) / 3), \
    C = A + A C =
    (2 / 3 x_1 + 1 / 3 x_2, 2 / 3 y_1 + 1 / 3 y_2).
  $
  同理可得
  $
    D = (1 / 3 x_1 + 2 / 3 x_2, 1 / 3 y_1 + 2 / 3 y_2).
  $
  这与线性插值的结论是一致的.

+ 设 $theta = angle(rr_1, rr_2)$, 则有
  $
    rr_1 dot rr_2 = abs(rr_1) abs(rr_2) cos theta, \
    rr_1 times rr_2 = abs(rr_1) abs(rr_2) sin theta. 
  $
  我们看到, 极坐标 $polar(abs(rr_1) abs(rr_2), theta)$
  转化成直角坐标即为 $(rr_1 dot rr_2, rr_1 times rr_2)$,
  由勾股定理即得
  $
    abs(rr_1 dot rr_2)^2 + abs(rr_1 times rr_2)^2
    = abs(rr_1)^2 abs(rr_2)^2.
  $

  #align(
    center,
    cetz.canvas((
      {
        import cetz.draw: *
        let (x, y) = (3, 2)
        line((0, 0), (x, 0), name: "x")
        line((x, 0), (x, y), name: "y")
        line((0, 0), (x, y), name: "r")
        mcontent("x.50%", $rr_1 dot rr_2$, south)
        mcontent("y.50%", $rr_1 times rr_2$, east, padding: 1.5mm)
        mcontent("r.50%", $abs(rr_1) dot abs(rr_2)$, north, angle: "r.end", padding: 1.5mm)
        // axis
        line((-1, 0), (x + 1, 0), mark: (end: "straight"))
        line((0, -1), (0, y + 0.5), mark: (end: "straight"))
        mcontent((x + 1, 0), $x$, east)
        mcontent((0, y + 0.5), $y$, west)
        let s = 0.5
        arc((s, 0), radius: s, start: 0deg, stop: calc.atan2(x, y))
        mcontent((18deg,s*1.5),$theta$,none)
      }
    )),
  )

+ 考虑向量 $A B, A P$ 的夹角 $theta$.
  只要知道点 $A, B, P$ 的坐标就可以计算 $theta$.

  `sp.math.subAngle(Angle(xA,yA,xP,yP), Angle(xA,yA,xB,yB))`

  知道夹角后问题就变得很简单了:
  当 $0degree < theta < 180degree$ 时,
  点 $P$ 位于直线 $A B$ 的一侧;
  当 $-180degree < theta < 0degree$ 时,
  点 $P$ 位于直线 $A B$ 的另一侧.

  我们也可以不计算具体夹角就解决问题.
  
  注意到 $0degree < theta < 180degree$
  相当于 $sin theta > 0$,
  $-180degree < theta < 0degree$
  相当于 $sin theta < 0$.
  而向量夹角的正弦值与向量外积有关.
  所以我们可以用外积作为判断依据:

  当 $A B times A P > 0$ 时 ,
  点 $P$ 位于直线 $A B$ 的一侧;
  当 $A B times A P < 0$ 时,
  点 $P$ 位于直线 $A B$ 的另一侧.

+ #text(fill: red, size: 6mm)[未编写答案]
