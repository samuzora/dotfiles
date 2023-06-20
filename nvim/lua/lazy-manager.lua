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

-- these must be set BEFORE starting lazy
vim.g.mapleader = " "
vim.g.localmapleader = " "
-- coq options
vim.g.coq_settings = {
  auto_start = "shut-up",
}

require("lazy").setup("plugins")
