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
