local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- these must be set before starting lazy

require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "kanagawa" }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  diff = {
    cmd = "diffview.nvim"
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "rplugin",
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    }
  }
})
