require("auto-session").setup({
  log_level = "error",
  cwd_change_handling = {
    post_cwd_handling_hook = function()
      require("lualine").refresh()
    end,
  }
})
