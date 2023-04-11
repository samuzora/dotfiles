return {
  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup()
    end,
    keys = {
      { "<leader>fd", ":Neotree toggle<CR>", desc = "Open filetree" }
    }
  },
  {
    "s1n7ax/nvim-window-picker",
    config = true,
  },

  -- oil.nvim (vim-like filesystem manipulation)
  {
    "stevearc/oil.nvim",
    keys = { { "-", ":Oil<CR>", desc = "Open parent directory in Oil" } },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("oil").setup({
        view_options = {
          show_hidden = true
        }
      })
    end,
    lazy = false
  },

}
