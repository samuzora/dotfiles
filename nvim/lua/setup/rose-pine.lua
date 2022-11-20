vim.o.background = 'dark'

require('rose-pine').setup({
  dark_variant = 'main',
  disable_float_background = true,
  disable_background = true,
})
local p = require('rose-pine.palette')

vim.cmd('colorscheme rose-pine')

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = nil })
vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = p.muted })
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = p.love })
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = p.gold })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = p.gold })
