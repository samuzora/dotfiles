local options = {
  smartindent   = true,
  autoindent    = true,

  smarttab      = true,
  expandtab     = true,
  tabstop       = 4,
  shiftwidth    = 0,
  softtabstop   = -1,

  splitkeep     = "screen",
  splitbelow    = true,
  splitright    = true,

  undofile      = true,
  backupcopy    = "yes",

  number        = true,
  cursorline    = true,
  mouse         = "nv",

  signcolumn    = "yes",

  ignorecase    = true,
  smartcase     = true,

  linebreak     = true,
  autochdir     = false,

  spell         = true,

  showmode      = false,
  cmdheight     = 0,
  conceallevel  = 2,
  termguicolors = true,
  laststatus    = 3,

  smoothscroll  = true,
  mousescroll   = "ver:1,hor:1",

  shell         = "nu",
}
for k, v in pairs(options) do vim.opt[k] = v end

vim.opt.shortmess:append('I')

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "U", "<C-r>")

vim.g.loaded_matchit           = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1

vim.g.clipboard                = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.5
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
end
