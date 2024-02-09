return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    init = function()
      -- Hide the (real) cursor when leaping, and restore it afterwards.
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapEnter',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=100')
          vim.opt.guicursor:append { 'a:Cursor/lCursor' }
        end,
      }
      )
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LeapLeave',
        callback = function()
          vim.cmd.hi('Cursor', 'blend=0')
          vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
        end,
      }
      )
    end,
    config = function()
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
    dependencies = "ggandor/leap.nvim",
    opts = {
      prefix = true
    }
  }
}
