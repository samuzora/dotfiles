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
    opts = {
      toggler = {
        line = "<leader>cc",
        block = "<leader>bb",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        above = "<leader>cO",
        below = "<leader>co",
        eol = "<leader>cA",
      }
    }
  },

  {
    "lambdalisue/suda.vim",
    config = function()
      vim.g["suda_smart_edit"] = 1
    end,
    keys = {
      { "<leader>w", vim.cmd.SudaWrite, desc = "Sudo write" }
    }
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree" }
    }
  }
}
