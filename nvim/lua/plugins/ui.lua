return {
  -- colorscheme
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- base00: "#161616"
      -- base01: "#262626"
      -- base02: "#393939"
      -- base03: "#525252"
      -- base04: "#dde1e6"
      -- base05: "#f2f4f8"
      -- base06: "#ffffff"
      -- base07: "#08bdba"
      -- base08: "#3ddbd9"
      -- base09: "#78a9ff"
      -- base0A: "#ee5396"
      -- base0B: "#33b1ff"
      -- base0C: "#ff7eb6"
      -- base0D: "#42be65"
      -- base0E: "#be95ff"
      -- base0F: "#82cfff"
      vim.opt.background = "dark"
      vim.cmd.colorscheme "oxocarbon"
      vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252" })
      vim.api.nvim_set_hl(0, "@text.strong", { fg = "#08bdba", bold = true })
      vim.api.nvim_set_hl(0, "@text.emphasis", { fg = "#ff7eb6", italic = true })
      vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#525252", italic = true })
      vim.api.nvim_set_hl(0, "@text.emphasis", { fg = "#ff7eb6", italic = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {})
    end
  },
  -- {
  --   "sam4llis/nvim-tundra",
  --   dependencies = {
  --     "kyazdani42/nvim-web-devicons"
  --   },
  --   config = function()
  --     -- tundra
  --     require('nvim-tundra').setup({
  --       transparent_background = true,
  --       syntax = {
  --         booleans = { bold = true, italic = true },
  --         comments = { bold = true, italic = true },
  --         conditionals = {},
  --         constants = { bold = true },
  --         fields = {},
  --         functions = {},
  --         keywords = {},
  --         loops = {},
  --         numbers = { bold = true },
  --         operators = { bold = true },
  --         punctuation = {},
  --         strings = {},
  --         types = { italic = true },
  --       },
  --       overwrite = {
  --         highlights = {
  --           LeapBackdrop = { link = "Comment" },
  --           SpellBad = { fg = "", bg = "", bold = false },
  --           ["NonText"] = { fg = "" },
  --           ["@text.strong"] = { bold = true },
  --           ["@text.emphasis"] = { italic = true },
  --           NormalFloat = { bg = "" },
  --         }
  --       }
  --     })
  --     vim.opt.background = 'dark'
  --     vim.cmd('colorscheme tundra')
  --     vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = "#4B5563" })
  --     ---
  --   end,
  -- },
  -- noice, nui and notify
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        routes = {
          {
            view = "notify",
            filter = {
              event = "msg_showmode"
            },
          },
          {
            view = "split",
            filter = {
              event = "msg_show", min_height = 10
            }
          },
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written"
            },
            opts = { skip = true }
          }
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = false,
        },
      })

      local stages_util = require("notify.stages.util")

      require("notify").setup({
        stages = {
          function(state)
            local next_height = state.message.height + 2
            local next_row = stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.BOTTOM_UP)
            if not next_row then
              return nil
            end
            return {
              relative = "editor",
              anchor = "NE",
              width = 1,
              height = state.message.height,
              col = vim.opt.columns:get(),
              row = next_row,
              border = "rounded",
              style = "minimal",
            }
          end,
          function(state)
            return {
              width = { state.message.width, frequency = 2 },
              col = { vim.opt.columns:get() },
            }
          end,
          function()
            return {
              col = { vim.opt.columns:get() },
              time = true,
            }
          end,
          function()
            return {
              width = {
                1,
                frequency = 2.5,
                damping = 0.9,
                complete = function(cur_width)
                  return cur_width < 2
                end,
              },
              col = { vim.opt.columns:get() },
            }
          end,
        },
        background_colour = "#000000",
      })
      vim.keymap.set("n", "<leader>nd", require("notify").dismiss)
    end,
    event = "VimEnter",
    keys = {
      { "<leader>nd", function() require("notify").dismiss() end, "Dismiss all notifications" },
    }
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- theme = "tundra",
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icons_enabled = true,
            padding = 2,
          },
        },
        lualine_b = {
          {
            'filename',
            separator = '|',
          },
          'diagnostics',
        },
        lualine_c = {
          "diagnostic-message"
        },
        lualine_x = {},
        lualine_y = {
          {
            'progress',
            separator = '|',
          },
          {
            'location',
            separator = '|',
          },
          'filesize',
        },
        lualine_z = {
          {
            'filetype',
            padding = 2,
          },
        }
      },
      tabline = {
        lualine_a = {
          {
            "tabs",
            mode = 1,
            separator = { '|', '|' },
          },
        },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { 'quickfix' },
    }
  },
  "Isrothy/lualine-diagnostic-message",

  -- dim unused code
  {
    "zbirenbaum/neodim",
    branch = "v2",
    event = "LspAttach",
    config = true
  },

  -- show colours on colour codes
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  -- indent line
  {
    "echasnovski/mini.indentscope",
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

  -- show context using treesitter
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      mode = "topline",
      separator = '-',
      zindex = 1,
    }
  },
}
