return {
  -- symbols outline
  {
    "simrat39/symbols-outline.nvim",
    opts = {},
    keys = {
      { "gs", "<cmd>SymbolsOutline<cr>", desc = "Symbols outline" }
    }
  },

  -- listing various lsp stuff
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "gd", function() require("trouble").toggle("lsp_definitions") end, desc = "List definitions" },
      { "gr", function() require("trouble").toggle("lsp_references") end,  desc = "List references" },
      { "gw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "List workspace diagnostics" },
      { "gb", function() require("trouble").toggle("document_diagnostics") end, desc = "Show buffer diagnostics" },
    }
  },

  -- hover menu
  {
    "lewis6991/hover.nvim",
    config = function()
      --- @diagnostic disable-next-line: redundant-parameter
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require('hover.providers.gh')
          require('hover.providers.gh_user')
        end,
        preview_opts = {
          border = nil
        },
        preview_window = false,
        title = true
      }
    end,
    keys = {
      { "K", function() require("hover").hover() end, desc = "Hover" },
      { "gK", function() require("hover").hover_select() end, desc = "Select provider for hover" }
    }
  },

  -- better code action menu
  {
    "luckasRanarison/clear-action.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        combine = true,
        show_label = true,
      }
    },
    keys = {
      {
        "gx", function() require("clear-action").code_action() end,
      }
    }
  },
}
