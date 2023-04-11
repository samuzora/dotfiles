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
vim.opt.lazyredraw     = false
vim.opt.cmdheight      = 0
vim.opt.showmode       = false
vim.opt.termguicolors  = true
vim.opt.conceallevel   = 2
vim.opt.shell          = "fish"
vim.opt.wrap           = false
vim.o.foldcolumn       = "1"
vim.o.foldlevel        = 99
vim.o.foldlevelstart   = 99
vim.o.foldenable       = true

vim.g.clipboard        = {
  name = 'WslClipboard',
  copy = { ['+'] = 'clip.exe',['*'] = 'clip.exe' },
  paste = {
    ['+'] = 'powershell.exe -noprofile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -noprofile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
