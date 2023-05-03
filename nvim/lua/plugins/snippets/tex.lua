local ls = require("luasnip")

return {
  ls.snippet(
    {
      trig = "tikz",
      dscr = "Tikzpicture snippet",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node({ "\\begin{figure}[!htb]", "\t\\begin{center}", "\t\t\\begin{tikzpicture}", "" }),
      ls.insert_node(3),
      ls.text_node({ "", "\t\t\\end{tikzpicture}", "\t\t\\caption{" }),
      ls.insert_node(1),
      ls.text_node({ "}", "\t\t\\label{fig:" }),
      ls.insert_node(2),
      ls.text_node({ "}", "\t\\end{center}", "\\end{figure}" }),
    }
  ),
  ls.snippet(
    {
      trig = "eqn",
      dscr = "Equation",
      regTrig = false,
      priority = 100,
      snippetType = "snippet"
    },
    {
      ls.text_node({ "\\begin{equation}", "\t\\begin{split}", "\t\t" }),
      ls.insert_node(1),
      ls.text_node({ "", "\t\\end{split}", "\\end{equation}" }),
    }
  ),
  ls.snippet(
    {
      trig = "table",
      dscr = "Table",
      regTrig = false,
      priority = 100,
      snippetType = "snippet",
    },
    {
      ls.text_node({ "\\begin{figure}[!htb]", "\t\\begin{center}", "\t\t\\begin{tabu} to \textwidth {" }),
      ls.insert_node(1),
      ls.text_node( {"} \\hline" } ),
      ls.insert_node(2),
      ls.text_node( { "", "\t\t\\end{tabu}", "\t\\end{center}", "\\end{figure}" } )
    }
  )
}
