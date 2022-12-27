require("neotest").setup({
  adapters = {
    require("neotest-python")
  }
})

vim.keymap.set('n', '<Leader>ntr', function() require("neotest").run.run() end)
