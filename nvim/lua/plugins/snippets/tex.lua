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
      ls.text_node({"\\begin{figure}[!htb]", "\t\\begin{center}", "\t\t\\begin{tikzpicture}", ""}),
      ls.insert_node(3),
      ls.text_node({"", "\t\t\\end{tikzpicture}", "\t\t\\caption{"}),
      ls.insert_node(1),
      ls.text_node({"}", "\t\t\\label{fig:"}),
      ls.insert_node(2),
      ls.text_node({"}", "\t\\end{center}", "\\end{figure}"}),
    }
  )

}
