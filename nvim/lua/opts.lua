local opt            = vim.opt

opt.expandtab        = true
opt.tabstop          = 4
opt.shiftwidth       = 4
opt.softtabstop      = 4
opt.smartindent      = true
opt.autoindent       = true
opt.smarttab         = true
opt.textwidth        = 0
opt.splitbelow       = true
opt.splitright       = true
opt.undofile         = true
opt.backupdir        = "/home/samuzora/.local/share/nvim/backup"
opt.mouse            = "nv"
opt.number           = true
opt.relativenumber   = true
opt.ignorecase       = true
opt.smartcase        = true
opt.linebreak        = true
opt.signcolumn       = "yes"
opt.cursorline       = false
opt.spell            = true
opt.lazyredraw       = false
opt.cmdheight        = 0
opt.showmode         = false
opt.termguicolors    = true
opt.conceallevel     = 2
opt.shell            = "fish"
vim.o.foldcolumn     = "1"
vim.o.foldlevel      = 99
vim.o.foldlevelstart = 99
vim.o.foldenable     = true

vim.g.clipboard      = {
  name = 'WslClipboard',
  copy = { ['+'] = 'clip.exe',['*'] = 'clip.exe' },
  paste = {
    ['+'] = 'powershell.exe -noprofile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -noprofile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
