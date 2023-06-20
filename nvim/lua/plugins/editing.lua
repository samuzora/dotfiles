return {
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function() require("mini.move").setup() end
  },
{
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function()
      require "mini.align".setup {
        mappings = {
          start_with_preview = "<M-a>"
        }
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    event = "VeryLazy",
    opts = {},
  },

  {
    "lambdalisue/suda.vim",
    config = function()
      vim.g["suda_smart_edit"] = 1
    end,
    keys = {
      { "<leader>w", ":SudaWrite<CR>", desc = "Sudo write" }
    }
  },
}
