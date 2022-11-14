require('telescope').setup({
  defaults = {
    mappings = {
      n = {
        ["<C-o>"] = function(prompt_bufnr) require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume() end,
      }
    }
  }
})
