local ls = require "luasnip"

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require "luasnip.extras.fmt".fmt

return {
  -- tikzpicture
  s(
    "tikz",
    fmt([[
      \begin{{figure}}[!htb]
          \begin{{center}}
              \begin{{tikzpicture}}
                  {}
              \end{{tikzpicture}}
              \caption{{{}}}
              \label{{fig:{}}}
          \end{{center}}
      \end{{figure}}
      ]],
      {
        i(3),
        i(1),
        i(2),
      }
    )
  ),

  -- equations
  s(
    "eqn",
    fmt([[
      \begin{{equation}}
          \begin{{split}}
              {}
          \end{{split}}
      \end{{equation}}
    ]],
      {
        i(0)
      }
    )
  ),

  -- tables
  s(
    "table",
    fmt([[
      \begin{{figure}}[!htb]
          \begin{{center}}
              \begin{{tabu}} to \textwidth {{}}
                  \hline
                  {}
                  \hline
              \end{{tabu}}
          \end{{center}}
      \end{{figure}}
    ]],
      {
        i(1),
        i(2),
      }
    )
  )
}
