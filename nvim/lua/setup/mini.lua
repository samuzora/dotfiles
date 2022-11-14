-- mini.nvim
require('mini.indentscope').setup ({
  draw = {
    delay = 500,
    animation = require('mini.indentscope').gen_animation('quadraticOut', { duration = 40, unit = "step" }),
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
    add = "ys",
    delete = "ds",
    find = "<leader>fs",
    find_left = "<leader>Fs",
    highlight = "<leader>hs",
    replace = "cs",
    update_n_lines = "",
  },
  n_lines = 50,
  search_method = "cover"
})

require("mini.pairs").setup({
  modes = {
    insert = true,
    command = false,
    terminal = false
  }
})

require('mini.ai').setup({
  search_method = "cover_or_nearest",
})

require('mini.align').setup({
  mappings = {
    start_with_preview = "<leader>a"
  }
})

local map = require('mini.map')
map.setup({
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.gitsigns(),
    map.gen_integration.diagnostic(),
  },
  symbols = {
    encode = map.gen_encode_symbols.dot('4x2'),
  },
  window = {
    show_integration_count = false,
    winblend = 0,
  }
})
map.open()

require('mini.bufremove').setup()
