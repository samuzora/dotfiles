vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    leap = true,
  }
})
vim.api.nvim_command("colorscheme catppuccin")
