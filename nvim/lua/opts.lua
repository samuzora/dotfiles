vim.opt.expandtab      = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.smarttab       = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.undofile       = true
vim.opt.backupdir      = "/home/samuzora/.local/share/nvim/backup"
vim.opt.mouse          = "nv"
vim.opt.number         = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.linebreak      = true
vim.opt.signcolumn     = "yes"
vim.opt.spell          = true
vim.opt.cmdheight      = 0
vim.opt.showmode       = false
vim.opt.termguicolors  = true
vim.opt.conceallevel   = 2
vim.opt.shell          = "fish"
vim.opt.smoothscroll   = true
vim.opt.mousescroll = "ver:1,hor:1"

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.5
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
end

vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 1,
}
