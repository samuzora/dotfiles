return {
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "ethanholz/nvim-lastplace",
    opts = {},
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

  -- treesitter-based node selection
  {
    "SUSTech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },

  -- keymaps
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

  -- marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- run code snippets
  {
    "michaelb/sniprun",
    build = "sh ./install.sh",
    opts = {
    }
  }
}
