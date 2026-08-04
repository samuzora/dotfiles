return {
  "nyoom-engineering/oxocarbon.nvim",
  event = "UIEnter",
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme "oxocarbon"

    -- leap
    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  end
}
