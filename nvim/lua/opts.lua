local options = {
  smartindent   = true,
  autoindent    = true,

  smarttab      = true,
  expandtab     = true,
  tabstop       = 4,
  softtabstop   = 4,

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

-- keymappings
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set({ "n", "v" }, "K", "k")
vim.keymap.set("n", "U", "<C-r>")

-- disable unused vim plugins
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tutor_mode_plugin = 1

-- wsl clipboard
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

-- i forgot what this does
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.opt.guicursor = "a:ver25"
  end
})

-- some neovide suppport
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.5
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
end
