return {
  -- show colours on colour codes
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.opt.termguicolors = true
      require("colorizer").setup()
    end
  },

  -- indent line
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup({
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
    end
  },

  -- code map
  {
    "echasnovski/mini.map",
    config = function()
      require("mini.map").setup({
        integrations = {
          require("mini.map").gen_integration.builtin_search(),
          require("mini.map").gen_integration.gitsigns(),
          require("mini.map").gen_integration.diagnostic(),
        },
        symbols = {
          encode = require("mini.map").gen_encode_symbols.dot("4x2")
        },
        window = {
          side = "right",
          show_integration_count = false,
          winblend = 0,
        }
      })
    end,
    keys = {
      { "<leader>mf", function() require("mini.map").toggle_focus() end, desc = "Focus minimap" },
      { "<leader>mt", function() require("mini.map").toggle() end,       desc = "Toggle minimap" },
    }
  },

  -- zen mode
  {
    "folke/zen-mode.nvim",
    config = true,
    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle({
            window = {
              width = .85
            }
          })
        end,
        desc = "zen mode"
      }
    }
  }

}
