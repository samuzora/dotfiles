return {
  -- lsp for neovim api
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "luvit-meta/library",
      }
    }
  },

  { "Bilal2453/luvit-meta", lazy = true },

  -- optional completion source for require statements and module annotations
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },

  -- lsp in markdown/embedded code
  {
    "jmbuhr/otter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    keys = {
      { "<leader>o", function() require("otter").activate() end, desc = "Start embedded LSP" }
    }
  }
}
