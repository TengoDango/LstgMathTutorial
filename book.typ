#import "@preview/shiroa:0.3.0": *

#show: book

#book-meta(
  title: "LuaSTG 数学基础",
  authors: ("TengoDango",),
  repository: "https://github.com/TengoDango/LstgMathTutorial",
  summary: [
    #prefix-chapter("前言 (看我! ).typ")[前言]
    = Stage 1 坐标系-描述点的位置
    - #chapter("Stage 1 坐标系-描述点的位置/1.1 极坐标系与三角函数.typ")[1.1 极坐标系与三角函数]
    - #chapter("Stage 1 坐标系-描述点的位置/1.2 三角函数公式.typ")[1.2 三角函数公式]
    - #chapter("Stage 1 坐标系-描述点的位置/1.3 平面向量.typ")[1.3 平面向量]
    - #chapter("Stage 1 坐标系-描述点的位置/1.4 线性变换与仿射坐标系.typ")[1.4 线性变换与仿射坐标系]
    = Stage 2 运动与曲线
    - #chapter("Stage 2 运动与曲线/2.1 运动学基础.typ")[2.1 运动学基础]
    - #chapter("Stage 2 运动与曲线/2.2 基本的运动模型.typ")[2.2 基本的运动模型]
  ],
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
