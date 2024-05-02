local options = {
  -- indentation
  autoindent    = true, -- keep indent when creating newline
  smartindent   = true, -- increase indentation according to syntax
  tabstop       = 4,    -- number of spaces per tab
  shiftwidth    = 0,    -- >>/<< (0: follows tabstop)
  softtabstop   = -1,   -- "virtual" tab length (-1: follows shiftwidth)
  smarttab      = true, -- follow shiftwidth when inserting/deleting tabs
  expandtab     = true, -- turn tabs/indents into spaces

  -- window layout management
  splitkeep     = "screen", -- keep cursorline on the same line on screen
  splitbelow    = true,
  splitright    = true,

  -- case sensitivity
  ignorecase    = true,
  smartcase     = true,

  -- soft wrapping
  wrap          = true,
  linebreak     = true,
  breakat       = " ^I!@*-+;:,./?",

  -- hard wrapping
  textwidth     = 120,

  -- ui options
  number        = true,
  cursorline    = true,
  signcolumn    = "yes",
  showmode      = false,
  cmdheight     = 0,
  conceallevel  = 2,
  termguicolors = true,
  laststatus    = 3,
  pumblend      = 10,

  -- misc
  mouse         = "nv", -- no mouse in insert mode
  autochdir     = false,
  undofile      = true, --
  backupcopy    = "yes",
  spell         = true,
  smoothscroll  = true,
  mousescroll   = "ver:1,hor:1",
  shell         = "/bin/bash", -- to allow !cmd to work
  virtualedit   = "all",

  list          = true,
  listchars     = "eol:↵,trail:~,tab:>-,nbsp:␣"
}
for k, v in pairs(options) do vim.opt[k] = v end

vim.opt.shortmess:append('I')


-- keymaps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("n", "qf", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  else
    vim.notify("Quickfix isn't populated yet")
  end
end)

vim.g.loaded_gzip          = 1
vim.g.loaded_zip           = 1
vim.g.loaded_zipPlugin     = 1
vim.g.loaded_tar           = 1
vim.g.loaded_tarPlugin     = 1
vim.g.loaded_vimball       = 1
vim.g.loaded_vimballPlugin = 1


vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1

vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1

vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1

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
