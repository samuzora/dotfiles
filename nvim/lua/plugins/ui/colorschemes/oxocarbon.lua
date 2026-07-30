return {
  "nyoom-engineering/oxocarbon.nvim",
  event = "UIEnter",
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme "oxocarbon"
  end
}
