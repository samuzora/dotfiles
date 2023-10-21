return {
  -- symbols outline
  {
    "simrat39/symbols-outline.nvim",
    opts = {},
    keys = {
      { "gs", "<cmd>SymbolsOutline<cr>", desc = "Symbols outline" }
    }
  },

  -- diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "gw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "List workspace diagnostics" }
    }
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      finder_action_keys = {
        open = 'o',
        vsplit = 's',
        split = 'i',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>'
      },
    },
    keys = {
      { "gk", "<cmd>Lspsaga hover_doc<CR>",             desc = "LSP hover" },
      { "gK", "<cmd>Lspsaga hover_doc ++keep<CR>",      desc = "LSP hover and pin to top right" },
      { "gr", "<cmd>Lspsaga finder ref<CR>",            desc = "Show symbol references" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>",       desc = "Peek definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>",       desc = "Go to definition" },
      { "gy", "<cmd>Lspsaga peek_type_definition<CR>",  desc = "Peek type definition" },
      { "gf", "<cmd>Lspsaga code_action<CR>",           desc = "Code action" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
      { "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>",  desc = "Show buffer diagnostics" },
      { "go", "<cmd>Lspsaga outline<CR>",               desc = "Show outline" },
    },
  },
}
