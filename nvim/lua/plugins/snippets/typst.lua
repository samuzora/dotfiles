local ls = require "luasnip"

return {
  ls.snippet(
    {
      trig = "setup",
      dsrc = "Template setup for IA/EE",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node {
        '#import "@preview/tablex:0.0.4": tablex, cellx, rowspanx, colspanx',
        '#import "@preview/cetz:0.0.1"',
        '',
        '#set par(justify: true)',
        '#set heading(numbering: "1.1")',
        '#set math.equation(numbering: "(1)")',
        '#set text(size: 12pt)',
      }
    }
  ),

  ls.snippet(
    {
      trig = "doublespacing",
      dsrc = "Double spacing",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node {
        "#set par(leading: 1.2em)",
        "#show par: set block(above: 2em, below: 2em)"
      }
    }
  ),

  ls.snippet(
    {
      trig = "canvas",
      dsrc = "Canvas",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node {
        '#figure(',
        '    cetz.canvas({',
        '        import cetz.draw: *',
        '    })',
        ')',
      }
    }
  ),

  ls.snippet(
    {
      trig = "wordcount",
      dsrc = "Word counter",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node {
        '#let count-words(it) = {',
        '    let fn = repr(it.func())',
        '    if fn == "sequence" { it.children.map(count-words).sum() }',
        '    else if fn == "text" { it.text.split().len() }',
        '    else if fn in ("emph", "strong") { count-words(it.body) }',
        '    else if fn == "styled" { count-words(it.child) }',
        '    else if fn == "box" { count-words(it.body) }',
        '    else if fn in ("footnote", "heading", "equation") { 0 }',
        '    else { 0 }',
        '}',
        '',
        '#show: rest => {',
        '    let n = count-words(rest)',
        '    rest + align([(#n words)])',
        '}',

      }
    }
  )
}
