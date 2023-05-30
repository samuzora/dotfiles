return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        }
      }
    }
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", desc = "Toggle undo tree" }
    }
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

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = true,
  },
}
