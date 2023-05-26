vim.opt.expandtab      = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.smarttab       = true
vim.opt.textwidth      = 0
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.undofile       = true
vim.opt.backupdir      = "/home/samuzora/.local/share/nvim/backup"
vim.opt.mouse          = "nv"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.linebreak      = true
vim.opt.signcolumn     = "yes"
vim.opt.cursorline     = false
vim.opt.spell          = true
vim.opt.cmdheight      = 0
vim.opt.showmode       = false
vim.opt.termguicolors  = true
vim.opt.conceallevel   = 2
vim.opt.shell          = "fish"
vim.opt.wrap           = false

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
