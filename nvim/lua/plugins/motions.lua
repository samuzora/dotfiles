return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      -- leap
      require 'leap'.add_default_mappings()
      require 'leap'.setup {
        equivalence_classes = {
          { " ",  "\t", "\r", "\n" },
          { "~",  "`" },
          { "1",  "!" },
          { "2",  "@" },
          { "3",  "#" },
          { "4",  "$" },
          { "5",  "%" },
          { "6",  "^" },
          { "7",  "&" },
          { "8",  "*" },
          { "9",  "(" },
          { "0",  ")" },
          { "-",  "_" },
          { "=",  "+" },
          { "[",  "{" },
          { "]",  "}" },
          { "\\", "|" },
          { ";",  ":" },
          { "'",  "\"" },
          { ",",  "<" },
          { ".",  ">" },
          { "/",  "?" },
        },
      }
    end,
  },
  {
    "ggandor/leap-spooky.nvim",
    event = "VeryLazy",
    dependencies = {
      "ggandor/leap.nvim"
    },
    config = true
  },

  -- enhanced w-e-b motions
  {
    "chrisgrieser/nvim-spider",
    opts = {},
    event = "VeryLazy",
  },

  -- window resizing
  {
    "roxma/vim-window-resize-easy",
    event = "VeryLazy",
  },
}
