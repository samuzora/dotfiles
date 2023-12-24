return {
  -- term-edit
  {
    "chomosuke/term-edit.nvim",
    ft = "toggleterm",
    opts = {
      prompt_end = "%$ "
    }
  },

  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "tt", desc = "Open terminal" },
    },
    config = function()
      require "toggleterm".setup {
        size = 20,
        shade_terminals = true,
        start_in_insert = false,
        open_mapping = "tt",
        insert_mappings = false,
        terminal_mappings = false,
        direction = "horizontal",
      }

      -- remap escape in terminal mode
      vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])
      vim.keymap.set("t", "<M-[>", "<esc>")
    end,
  },
}
