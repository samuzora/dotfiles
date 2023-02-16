local opt = vim.opt

opt.expandtab            = true
opt.tabstop              = 4
opt.shiftwidth           = 4
opt.softtabstop          = 4
opt.smartindent          = true
opt.autoindent           = true
opt.smarttab             = true
opt.textwidth            = 0
opt.splitbelow           = true
opt.splitright           = true
opt.undofile             = true
opt.backupdir            = "/home/samuzora/.local/share/nvim/backup"
opt.mouse                = "nv"
opt.number               = true
opt.relativenumber       = true
opt.ignorecase           = true
opt.smartcase            = true
opt.linebreak            = true
opt.signcolumn           = "yes"
opt.cursorline           = false
-- opt.foldmethod           = 'expr'
-- opt.foldenable           = false
-- opt.foldexpr             = 'nvim_treesitter#foldexpr()'
opt.spell                = true
opt.lazyredraw           = false
opt.cmdheight            = 0
opt.showmode             = false
opt.termguicolors        = true
vim.g['suda_smart_edit'] = 1
opt.conceallevel         = 2
opt.shell                = "fish"
vim.o.foldcolumn         = '1'
vim.o.foldlevel          = 99
vim.o.foldlevelstart     = 99
vim.o.foldenable         = true

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     opt.foldenable = false
--   end
-- })
