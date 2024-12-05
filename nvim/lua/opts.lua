local options = {
  -- indentation
  autoindent    = true, -- keep indent when creating newline
  smartindent   = true, -- increase indentation according to syntax
  tabstop       = 2,    -- number of spaces per tab
  shiftwidth    = 0,    -- >>/<< (0: follows tabstop)
  softtabstop   = -1,   -- "virtual" tab length (-1: follows shiftwidth)
  smarttab      = true, -- follow shiftwidth when inserting/deleting tabs
  expandtab     = true, -- turn tabs/indents into spaces

  -- window layout management
  splitkeep     = "screen", -- keep cursorline on the same line on screen
  splitbelow    = true,     -- split to the bottom first
  splitright    = true,     -- split to the right first

  -- case sensitivity
  ignorecase    = true, -- ignore case when searching
  smartcase     = true, -- unless there's an uppercase letter

  -- soft wrapping
  wrap          = true,             -- wrap long lines instead of overflowing
  linebreak     = true,             -- break at 'breakat' characters
  breakat       = " ^I!@*-+;:,./?", -- break at these characters

  -- hard wrapping
  textwidth     = 120, -- hard wrap at 120 characters

  -- ui options
  number        = true,  -- show line numbers
  cursorline    = true,  -- highlight current line
  signcolumn    = "yes", -- always show sign column
  showmode      = false, -- don't show mode in cmdline (but cmdheight is 0 so no effect)
  cmdheight     = 0,     -- don't show cmdline
  conceallevel  = 2,     -- concealed text is completely hidden unless is has a custom replacement character
  termguicolors = true,  -- true colours
  laststatus    = 3,     -- global status line
  pumblend      = 10,    -- popup menu transparency

  -- misc
  mouse         = "nv", -- no mouse in insert mode
  autochdir     = false, -- don't change directory to the file's directory
  undofile      = true, -- persistent undo history
  backupcopy    = "yes", -- force overwrite files to trigger update events (the default is to rename the original and write a new file)
  spell         = true, -- spell check
  smoothscroll  = true, -- scrolling on wrapped lines is per screen line, not per text line
  mousescroll   = "ver:1,hor:1", -- scroll 1 column/row at a time when using mouse wheel
  shell         = "/bin/bash", -- set shell to bash to allow !cmd to work

  list          = true, -- show invisible characters
  listchars     = "eol:↵,trail:~,tab:>-,nbsp:␣", -- use these characters

  -- for tabline
  showtabline = 2,
}
for k, v in pairs(options) do vim.opt[k] = v end

vim.opt.shortmess:append('I')

local globals = {
  mapleader                = " ",
  maplocalleader           = " ",

  -- disable built-in plugins
  loaded_gzip              = 1,
  loaded_zip               = 1,
  loaded_zipPlugin         = 1,
  loaded_tar               = 1,
  loaded_tarPlugin         = 1,
  loaded_vimball           = 1,
  loaded_vimballPlugin     = 1,

  loaded_getscript         = 1,
  loaded_getscriptPlugin   = 1,

  loaded_tutor_mode_plugin = 1,
  loaded_matchit           = 1,
  loaded_2html_plugin      = 1,
  loaded_logiPat           = 1,
  loaded_rrhelper          = 1,

  loaded_netrw             = 1,
  loaded_netrwPlugin       = 1,
  loaded_netrwSettings     = 1,
  loaded_netrwFileHandlers = 1,

  clipboard                = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 1,
  }
}
for k, v in pairs(globals) do vim.g[k] = v end

-- i don't even use neovide why is this here
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.5
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
end

-- keymaps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<Leader>qf", function()
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
vim.keymap.set("n", "<Leader>cd", "<cmd>lcd %:p:h<CR>", { desc = "Change directory to buffer path for current window" })
vim.keymap.set("n", "<Leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy window" })
vim.keymap.set("n", "<Leader>cl",
  function()
    require("notify").dismiss()
    vim.cmd [[noh]]
    vim.cmd [[diffupdate]]
  end,
  { desc = "Refresh screen and clear notifications" }
)

-- quick tab navigation
-- TODO make <leader> a function/autocmd so we can jump to arbitrary tabs, not limited to 10
vim.keymap.set("n", "<Leader>1", "1gt")
vim.keymap.set("n", "<Leader>2", "2gt")
vim.keymap.set("n", "<Leader>3", "3gt")
vim.keymap.set("n", "<Leader>4", "4gt")
vim.keymap.set("n", "<Leader>5", "5gt")
vim.keymap.set("n", "<Leader>6", "6gt")
vim.keymap.set("n", "<Leader>7", "7gt")
vim.keymap.set("n", "<Leader>8", "8gt")
vim.keymap.set("n", "<Leader>9", "9gt")
vim.keymap.set("n", "<Leader>0", "10gt")

-- temp override for nightly v0.12.0
vim.deprecate = function() end
