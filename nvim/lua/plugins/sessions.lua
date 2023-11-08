vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
  {
    "rmagatti/auto-session",
    opts = {
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_allowed_dirs = {
        "/home/samuzora/.config/nvim",
        "/home/samuzora/github/hackac-platform",
        "/home/samuzora/github/ctf-cord",
      },
    }
  },
}
