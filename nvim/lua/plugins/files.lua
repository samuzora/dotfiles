vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  -- oil.nvim (vim-like filesystem manipulation)
  {
    "stevearc/oil.nvim",
    lazy = false, -- if lazy loaded, plugin will break
    keys = { { "-", ":Oil<CR>", desc = "Open parent directory in Oil" } },
    opts = {
      view_options = {
        show_hidden = true
      }
    }
  }
}
