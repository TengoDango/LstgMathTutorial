#import "@preview/shiroa:0.3.0": *
#import "index.typ": *

#show: book

#book-meta(
  title: "LuaSTG 数学基础",
  authors: ("TengoDango",),
  repository: "https://github.com/TengoDango/LstgMathTutorial",
  summary: [
    #prefix-chapter("docs/preface.typ", strong[前言])
    = #s1
    - #chapter("docs/stage-1/1-1.typ", s1-1, section: "1.1")
    - #chapter("docs/stage-1/1-2.typ", s1-2, section: "1.2")
    - #chapter("docs/stage-1/1-3.typ", s1-3, section: "1.3")
    - #chapter("docs/stage-1/1-4.typ", s1-4, section: "1.4")
    = #s2
    - #chapter("docs/stage-2/2-1.typ", s2-1, section: "2.1")
    = #ex
    - #chapter("docs/stage-ex/ex-3.typ", ex-3, section: none)
    = 附录
    - #suffix-chapter("docs/notes-table.typ")[记号表]
    - #suffix-chapter("docs/answers.typ")[习题参考答案]
  ],
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
