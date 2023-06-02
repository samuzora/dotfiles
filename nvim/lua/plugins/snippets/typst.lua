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
        '#import "//home/samuzora/.config/typst/plugins/tablex/tablex.typ": *',
        '#import "//home/samuzora/.config/typst/plugins/canvas/canvas.typ": canvas',
        '',
        '#set par(justify: true)',
        '#set heading(numbering: "1.1")',
        '#set math.equation(numbering: "(1)")',
        '#set text(font: "Arial", size: 12pt)',
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
        '#canvas({',
        '    import "//home/samuzora/.config/typst/plugins/canvas/draw.typ": *',
        '})'
      }
    }
  )
}
