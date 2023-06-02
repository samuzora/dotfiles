return {
  {
    "ggandor/leap.nvim",
    config = function()
      vim.api.nvim_set_hl(0, 'LeapMatch', { fg = "#faa0a0", bold = true })
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = "Comment" })
      vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = "#bebefa", bold = true })
      vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = "#aafaaa", bold = true })
      require 'leap'.add_default_mappings()
      require 'leap'.setup {
        equivalence_classes = {
          { " ", "\t", "\r", "\n" },
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
    "ggandor/flit.nvim",
    event = "VeryLazy",
    dependencies = {
      "ggandor/leap.nvim"
    },
    config = true
  },
  {
    "ggandor/leap-spooky.nvim",
    event = "VeryLazy",
    dependencies = {
      "ggandor/leap.nvim"
    },
    config = true
  },
}
