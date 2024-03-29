return {
  -- symbols outline
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "gs", "<cmd>SymbolsOutline<cr>", desc = "Symbols outline" }
    },
    opts = {},
  },

  -- lsp hover window
  {
    "lewis6991/hover.nvim",
    keys = {
      { "K",  function() require("hover").hover() end,        mode = { "n", "v" },               desc = "Hover" },
      { "gK", function() require("hover").hover_select() end, desc = "Select provider for hover" }
    },
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
  },

  -- better code action menu
  {
    "luckasRanarison/clear-action.nvim",
    keys = {
      { "<leader>f", function() require("clear-action").code_action() end }
    },
    opts = {
      signs = {
        combine = true,
        show_label = true,
      }
    },
  },

  -- highlights + textobjs for current LSP keyword under cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "treesitter" },
        delay = 50,
        filetypes_denylist = {
          "oil",
          "Trouble",
          "TelescopePrompt",
          "qf",
          "toggleterm",
          "DiffviewFiles",
        }
      })
    end
  },

  -- lsp lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
      })
      require("lsp_lines").setup()
    end,
    keys = {
      {
        "<leader>ll",
        function()
          local enabled = require("lsp_lines").toggle()
          if enabled then
            vim.diagnostic.config({
              virtual_text = false
            })
          else
            vim.diagnostic.config({
              virtual_text = true
            })
          end
        end,
        desc = "Toggle LSP lines"
      }
    }
  }
}
