return {
  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "toggleterm".setup {
        size = 20,
        shade_terminals = false,
        open_mapping = "tt",
        insert_mappings = false,
        terminal_mappings = false,
        direction = "horizontal",
      }

      -- lazygit integration
      local terminal = require "toggleterm.terminal".Terminal
      local lazygit = terminal:new { cmd = "lazygit", direction = "float", hidden = true }
      vim.keymap.set("", "tl", function() lazygit:toggle() end)

      -- remap escape in terminal mode
      vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])
      vim.keymap.set("t", "<M-[>", "<esc>")
    end,
    keys = {
      { "tt",  desc = "Open terminal" },
      { "tl", desc = "Open lazygit" },
    }
  },
  {
    "chomosuke/term-edit.nvim",
    ft = "toggleterm",
    opts = {
      prompt_end = "%$ "
    }
  },
}
