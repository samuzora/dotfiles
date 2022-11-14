require('legendary').setup({
  keymaps = {
    { '<c-j>', '<c-w><c-j>', description = 'Shift focus to the window below.' },
    { '<c-k>', '<c-w><c-k>', description = 'Shift focus to the window above.' },
    { '<c-l>', '<c-w><c-l>', description = 'Shift focus to the window to the right.' },
    { '<c-h>', '<c-w><c-h>', description = 'Shift focus to the window to the left.' }
  }
})
