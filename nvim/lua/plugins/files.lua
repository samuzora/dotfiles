return {
  -- oil.nvim (vim-like filesystem manipulation)
  {
    "stevearc/oil.nvim",
    lazy = false,
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
  },
}
