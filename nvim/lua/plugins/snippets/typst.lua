local ls = require "luasnip"

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require "luasnip.extras.fmt".fmt

return {
  -- preamble
  s(
    "setup",
    {
      t(
        [[
        #import "@preview/tablex:0.0.5": tablex, cellx, rowspanx, colspanx
        #import "@preview/cetz:0.0.2"
        #import "@preview/metro:0.1.0": unit, units, prefixes
        #import units: *
        #import prefixes: *

        #set par(justify: true)
        #set heading(numbering: "1.1")
        #set math.equation(numbering: "(1)")
        #set text(size: 12pt)
      ]]
      )
    }
  ),


  -- double spacing for lines
  s(
    "doublespacing",
    {
      t(
        [[
        #set par(leading: 1.2em)
        #show par: set block(above: 2em, below: 2em)
      ]]
      )
    }
  ),


  -- diagrams
  s(
    "canvas",
    {
      t(
        [[
        #figure(
          cetz.canvas({{
            import cetz.draw: *
          }})
        )
      ]]
      )
    }
  ),


  -- axes for econs graphs
  s("econs",
    {
      t(
        [[
        #figure(
          cetz.canvas({{
            import cetz.draw: *
            line((0, 10), (0, 0), (10, 0), mark: ( start: ">", end: ">" ))
          }})
      ]]
      )
    }
  ),


  -- tables
  s("tablex",
    fmt(
      [[
      #tablex(
        columns: ({}),
      )
    ]],
      {
        i(0, "auto, 1fr")
      }
    )
  ),


  -- units
  s("unit",
    fmt(
      [[
        unit(${}$)
      ]],
      {
        i(0)
      }
    )),


  -- chem formulae
  s(
    "whalogen",
    {
      t(
        [[
          #import "@preview/whalogen:0.1.0": ce
        ]]
      )
    }
  ),
  s("chem", fmt(
    [[
      #ce("{}")
    ]],
    {
      i(0)
    }
  )),


  -- wordcount function
  s(
    "wordcount",
    {
      t(
        [[
        #let count-words(it) = {{
        let fn = repr(it.func())
        if fn == "sequence" {{ it.children.map(count-words).sum() }}
        else if fn == "text" {{ it.text.split().len() }}
        else if fn in ("emph", "strong", "listitem", "align", "enumitem") {{ count-words(it.body) }}
        else if fn == "styled" {{ count-words(it.child) }}
        else if fn = box {{ count-words(it.body) }}
        else if fn in ("footnote", "heading", "equation") {{ 0 }}
        else {{ 0 }}
      }}

      #show: rest => {{
        let n = count-words(rest)
        rest + align([(#n words)])
      }}
    ]])
    }
  )
}
