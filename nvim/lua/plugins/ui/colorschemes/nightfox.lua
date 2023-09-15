return {
  "EdenEast/nightfox.nvim",
  main = "nightfox",
  config = function()
    require "nightfox".setup {
      groups = {
        all = {
          WinSeparator = { link = "Normal" },
          LeapPrimary = { style = "bold" },
          Pmenu = { bg = "bg0" },
        }
      }
    }
    vim.cmd 'colorscheme nightfox'
  end,
}
