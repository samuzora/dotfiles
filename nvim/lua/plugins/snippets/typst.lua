local ls = require "luasnip"

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require "luasnip.extras.fmt".fmt

return {
  -- imports
  s(
    "util",
    fmt(
      [[
        #import "@preview/tablex:0.0.8": tablex, gridx, cellx, rowspanx, colspanx, hlinex, vlinex
        #import "@preview/cetz:0.2.1"
        #import cetz.plot
        #import "@preview/oxifmt:0.2.0": strfmt
        #import "@preview/metro:0.2.0": *
      ]],
      {}
    )
  ),

  -- preamble
  s(
    "template",
    fmt(
      [[
        #let project = (title: "", body) => {{
          set text(size: 11pt)
          set par(justify: true, leading: 1em)
          show par: set block(above: 1.5em, below: 1.5em)
          set heading(numbering: "1.1")
          show bibliography: set heading(numbering: "1.1")
          set math.equation(numbering: "(1)")
          show raw.where(block: true): set par(leading: 2.5pt)
          show raw.where(block: true, lang: "python"): set text(size: 7pt)

          set page(
            "a4",
            numbering: (cur, max) => strfmt("Page {{}} of {{}}", cur, max),
          )


          [
            #align(center, text(title,
              size: 13pt,
              weight: 600,
            ))
            #body
          ]
        }}
      ]],
      {}
    )
  ),


  -- 2.0 spacing
  s(
    "doublespacing",
    fmt(
      [[
        #set par(leading: 1.2em)
        #show par: set block(above: 2em, below: 2em)
      ]],
      {}
    )
  ),


  -- diagrams
  s(
    "canvas",
    fmt(
      [[
        cetz.canvas({{
          import cetz.draw: *
          {}
        }})
      ]],
      {i(1)}
    )
  ),

  s(
    "plot",
    fmt(
      [[
        cetz.canvas({{
          import cetz.draw: *
          plot.plot(
            size: (10, 5),
            {{
              {}
            }}
          )
        }})
      ]],
      {i(1)}
    )
  ),


  -- axes for econs graphs
  s("econs",
    fmt(
      [[
        cetz.canvas({{
          import cetz.draw: *
          line((0, 10), (0, 0), (10, 0), mark: ( start: ">", end: ">" ))
        }}
      ]],
      {}
    )
  ),


  -- tables
  s("tablex",
    fmt(
      [[
        tablex(
          columns: ({}),
        )
    ]],
      {
        i(0, "auto, 1fr")
      }
    )
  ),

  -- gridx
  s("gridx",
    fmt(
      [[
        gridx(
          columns: ({}),
        )
    ]],
      {
        i(0, "auto, 1fr")
      }
    )
  ),


  -- units
  s("qty",
    fmt(
      [[
        qty("{}", "{}"){}
      ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),

  -- wordcount function
  s(
    "wordcount",
    fmt(
      [[
        #let count-words(it) = {{
          let fn = repr(it.func())
          if fn == "sequence" {{ it.children.map(count-words).sum(default: 0) }}
          else if fn == "text" {{ it.text.split().len() }}
          else if fn in ("emph", "strong", "listitem", "align", "enumitem") {{ count-words(it.body) }}
          else if fn == "styled" {{ count-words(it.child) }}
          else if fn == box {{ count-words(it.body) }}
          else if fn in ("footnote", "heading", "equation") {{ 0 }}
          else {{ 0 }}
        }}

        #show: rest => {{
          let n = count-words(rest)
          rest + align([(#n words)])
        }}
      ]],
      {}
    )
  )
}
