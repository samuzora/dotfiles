return {
  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = "<leader>t",
        insert_mappings = false,
        terminal_mappings = false,
        direction = "horizontal",
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
      { "<leader>t",  desc = "Open terminal" },
      { "<leader>gl", desc = "Open lazygit" },
    }
  },
  {
    "chomosuke/term-edit.nvim",
    ft = "toggleterm",
    enabled = true,
    opts = {
      prompt_end = "%$ "
    }
  },
}