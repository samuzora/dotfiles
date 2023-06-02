return {
  -- {
  --   "echasnovski/mini.move",
  --   event = "VeryLazy",
  --   config = function() require("mini.move").setup() end
  -- },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    event = "VeryLazy",
    opts = {},
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require "mini.align".setup {
        mappings = {
          start_with_preview = "<C-a>"
        }
      }
    end
  },
}
