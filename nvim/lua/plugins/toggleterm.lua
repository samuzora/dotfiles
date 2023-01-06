return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = vim.o.columns * 0.4,
      open_mapping = "<Leader>t",
      insert_mappings = false,
      terminal_mappings = false,
      direction = "vertical",
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end
      }
    })

    -- lazygit integration
    local terminal = require("toggleterm.terminal").Terminal
    local lazygit = terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
    vim.keymap.set('', '<leader>gl', function() lazygit:toggle() end)

    -- remap escape in terminal mode
    vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])
    vim.keymap.set("t", "<M-[>", "<esc>")

  end,
  keys = {
    "<leader>t", "<leader>gl"
  }
}
