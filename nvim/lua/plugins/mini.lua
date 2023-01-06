local M = {
  'echasnovski/mini.nvim',
}

function M.config()
  require('mini.indentscope').setup({
    draw = {
      delay = 500,
      gen_animation = {
        'quadraticOut',
        {
          duration = 40,
          unit = "step"
        }
      }
    },

    mappings = {
      object_scope = 'ii',
      object_scope_with_border = 'ai',
      goto_top = '[i',
      goto_bottom = ']i',
    },

    options = {
      border = 'both',
      indent_at_cursor = true,
      try_as_border = true,
    },
    symbol = '╎',
  })

  require("mini.comment").setup()

  require("mini.surround").setup({
    highlight_duration = 500,
    mappings = {
      add = "<C-s>i",
      delete = "<C-s>d",
      find = "<C-s>f",
      find_left = "<C-s>F",
      highlight = "<C-s>h",
      replace = "<C-s>r",
      update_n_lines = "<C-s>n",
    },
    n_lines = 20,
    search_method = "cover"
  })

  -- require("mini.pairs").setup({
  --   modes = {
  --     insert = true,
  --     command = false,
  --     terminal = false
  --   }
  -- })

  require('mini.ai').setup({
    search_method = "cover_or_nearest",
  })

  local map = require('mini.map')
  map.setup({
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.gitsigns(),
      map.gen_integration.diagnostic(),
    },
    window = {
      side = "right",
      show_integration_count = false,
      winblend = 0,
    }
  })
  vim.keymap.set('n', '<Leader>mf', map.toggle_focus)
  vim.keymap.set('n', '<Leader>mt', map.toggle)

end

return M
