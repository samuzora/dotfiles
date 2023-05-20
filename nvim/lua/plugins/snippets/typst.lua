local ls = require("luasnip")

return {
  ls.snippet(
    {
      trig = "imports",
      dsrc = "Template imports",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node{
        '#import "//home/samuzora/.config/typst/plugins/tablex.typ": tablex, hlinex, vlinex, colspanx, rowspanx' 
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
      ls.text_node{
        "#set par(leading: 1.2em)",
        "#show par: set block(above: 2em, below: 2em)"
      }
    }
  )
}
