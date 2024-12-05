return {
  -- lsp hover window
  {
    "lewis6991/hover.nvim",
    keys = {
      {
        "K",
        function() require("hover").hover() end,
        mode = { "n", "v" },
        desc = "Hover"
      },
      {
        "<C-s>",
        function() require("hover").hover() end,
        mode = { "i" },
        desc = "Hover in insert mode"
      },
      {
        "gK",
        function() require("hover").hover_select() end,
        desc = "Select provider for hover"
      }
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

  -- highlights + jumps for current LSP keyword under cursor
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        providers = { "lsp", "treesitter" },
        delay = 300,
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

  -- cool stuff for lsp signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      toggle_key = "<C-s>",
    },
    config = function(_, opts)
      require "lsp_signature".setup(opts)
    end,
  },

  -- lsp lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
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
