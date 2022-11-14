local function nnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true })
end

local function vnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true })
end

local function tnoremap(lhs, rhs)
  vim.api.nvim_set_keymap('t', lhs, rhs, { noremap = true })
end

vim.api.nvim_create_user_command('SwitchTab',
  function(tbl)
    vim.api.nvim_input(string.format('%sgt', tbl.args))
  end,
  { nargs = 1 }
)

vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.keymap.set('n', '<leader>p', function() require("nabla").popup({ border = "rounded" }) end)
vim.keymap.set('n', '<leader>P', require("nabla").toggle_virt)
nnoremap('<leader>ff', ':Telescope find_files<CR>')
nnoremap('<leader>fg', ':Telescope live_grep<CR>')
nnoremap('<leader>fb', ':Telescope buffers<CR>')
nnoremap('<leader>fh', ':Telescope help_tags<CR>')

vim.keymap.set('n', '<leader>lf', function() vim.cmd(":Trouble") end)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.code_action)

vim.keymap.set('', '<leader>s', require('trevj').format_at_cursor)
local nt = require("nvim-tree.api")
vim.keymap.set('n', '<leader>d', function() nt.tree.toggle(true) end)
local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
vim.keymap.set('', '<leader>gl', function() lazygit:toggle() end)
-- vim.keymap.set('', '<leader>l', require("lsp_lines").toggle)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

local minimap = require("mini.map")
vim.keymap.set('n', '<Leader>mf', minimap.toggle_focus)
vim.keymap.set('n', '<Leader>mt', minimap.toggle)

vnoremap('K', '<nop>')
tnoremap('<Esc>', [[<c-\><c-n>]])
tnoremap('<M-[>', '<esc>')
nnoremap('<leader>c', ':PickColor<CR>')
nnoremap('<leader>b', ':ls<CR>:b')
nnoremap('<leader>w', ':SwitchTab')
nnoremap('<leader>gb', ':GitBlameToggle<CR>')
nnoremap('<leader>n', ':LualineRenameTab ')
nnoremap("<leader>za", ":TZAtaraxis<CR>")
