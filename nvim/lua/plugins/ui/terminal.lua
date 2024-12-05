-- remap escape in terminal mode
vim.keymap.set("t", "<Esc>", [[<c-\><c-n>]])
vim.keymap.set("t", "<M-[>", "<esc>")

return {
  -- term-edit
  {
    "chomosuke/term-edit.nvim",
    enabled = false,
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
    opts = {
      size = 20,
      shell = "nu",
      shade_terminals = true,
      shading_factor = "-30",
      start_in_insert = false,
      open_mapping = "tt",
      insert_mappings = false,
      terminal_mappings = false,
      direction = "horizontal",
      winbar = {
        enabled = true,
      },
    },
  },
}
