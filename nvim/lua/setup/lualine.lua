local p = require('rose-pine.palette')

local rose_pine = {
  normal = {
    a = { bg = p.rose, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.rose },
    c = { fg = p.none, bg = p.none },
  },
  insert = {
    a = { bg = p.foam, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.foam },
    c = { fg = p.none, bg = p.none },
  },
  visual = {
    a = { bg = p.iris, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.iris },
    c = { fg = p.none, bg = p.none },
  },
  replace = {
    a = { bg = p.pine, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.pine },
    c = { fg = p.none, bg = p.none },
  },
  command = {
    a = { bg = p.love, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.love },
    c = { fg = p.none, bg = p.none },
  },
  terminal = {
    a = { bg = p.text, fg = p.base, gui = 'bold' },
    b = { bg = p.overlay, fg = p.text },
    c = { fg = p.none, bg = p.none },
  },
  inactive = {
    a = { bg = p.base, fg = p.muted, gui = 'bold' },
    b = { bg = p.base, fg = p.muted },
    c = { fg = p.none, bg = p.none },
  },
}

require('lualine').setup {
  options = {
    theme = rose_pine,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {
      {
        'mode',
        icons_enabled = true,
        padding = 2,
      },
    },
    lualine_b = {
      {
        'filename',
        separator = '|',
      },
      'diagnostics',
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        'progress',
        separator = '|',
      },
      {
        'location',
        separator = '|',
      },
      'filesize',
    },
    lualine_z = {
      {
        'filetype',
        padding = 2,
      },
    }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'quickfix', },
}
