return {
  -- move blocks of text
  {
    "echasnovski/mini.move",
    enabled = false,
    keys = {
      { "<M-h>", mode = { "n", "v" } },
      { "<M-j>", mode = { "n", "v" } },
      { "<M-k>", mode = { "n", "v" } },
      { "<M-l>", mode = { "n", "v" } },
    },
    config = true,
  },

  -- align text
  {
    "echasnovski/mini.align",
    keys = {
      { "ga", mode = { "n", "v" }, desc = "Align text" },
      { "gA", mode = { "n", "v" }, desc = "Align text with preview" }
    },
    config = true
  },
}
