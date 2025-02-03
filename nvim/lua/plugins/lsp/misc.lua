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
