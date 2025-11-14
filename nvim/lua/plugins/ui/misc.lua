return {
  -- better vim.ui.select
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {}
  },

  -- change colour of cursorline etc
  {
    "rasulomaroff/reactive.nvim",
    dependencies = {
      "rebelot/kanagawa.nvim",
    },
    event = "VeryLazy",
    config = function()
      local colors = require("kanagawa.colors").setup()
      local palette = colors.palette
      local theme = colors.theme
      local Color = require("kanagawa.lib.color")

      local darkViolet = Color(palette.oniViolet):brighten(-0.55):to_hex()

      require("reactive").add_preset {
        name = "kanagawa",
        static = {
          winhl = {
            inactive = {
              CursorLine = { bg = palette.winterBlue, }
            }
          }
        },
        modes = {
          -- Normal
          n = {
            winhl = {
              CursorLine = { bg = theme.ui.bg_p2 }
            }
          },

          -- Insert
          i = {
            winhl = {
              CursorLine = { bg = palette.winterGreen }
            }
          },

          -- Replace
          R = {
            winhl = {
              CursorLine = { bg = darkViolet }
            }
          },

          -- C-o in Insert
          niI = {
            winhl = {
              CursorLine = { bg = Color(palette.winterGreen):blend(theme.ui.bg_p2, 0.5):to_hex() }
            }
          },

          -- C-o in Replace
          niR = {
            winhl = {
              CursorLine = { bg = Color(darkViolet):blend(theme.ui.bg_p2, 0.5):to_hex() }
            }
          },
          -- takes no effect since cursorline disabled in visual mode
          -- niV = {
          --   winhl = {
          --      = { bg = Color(palette.waveBlue1):blend(theme.ui.bg_p2, 0.5):to_hex() }
          --   }
          -- },

          -- Normal op-pending
          no = {
            winhl = {
              CursorLine = { bg = theme.ui.bg_m3 }
            },
            operators = {
              [{ "gu", "gU", "g~", "~" }] = {
                CursorLine = { bg = Color(palette.waveBlue2):blend(theme.ui.bg_p2, 0.5):to_hex() }
              },
              c = {
                winhl = {
                  CursorLine = { bg = palette.winterYellow }
                }
              },
              d = {
                winhl = {
                  CursorLine = { bg = palette.winterRed }
                }
              },
              y = {
                winhl = {
                  CursorLine = { bg = Color(palette.sakuraPink):brighten(-0.6):to_hex() }
                }
              }
            }
          }
        }
      }
    end,
  },

  -- matchparen
  {
    "utilyre/sentiment.nvim",
    event = "VeryLazy",
    opts = {},
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
    end,
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- live command preview
  {
    "smjonas/live-command.nvim",
    event = "CmdlineEnter",
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
        }
      }
    end
  },

  -- undo view
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree" }
    }
  },

  -- color picker
  {
    "uga-rosa/ccc.nvim",
    enabled = false,
    ft = { "css", "scss", "html", "javascript", "typescript", "javascriptextended", "typescriptextended" },
    config = function()
      local ColorInput = require("ccc.input")
      local convert = require("ccc.utils.convert")

      local RgbHslCmykInput = setmetatable({
        name = "RGB/HSL/CMYK",
        max = { 1, 1, 1, 360, 1, 1, 1, 1, 1, 1 },
        min = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        delta = { 1 / 255, 1 / 255, 1 / 255, 1, 0.01, 0.01, 0.005, 0.005, 0.005, 0.005 },
        bar_name = { "R", "G", "B", "H", "S", "L", "C", "M", "Y", "K" },
      }, { __index = ColorInput })

      function RgbHslCmykInput.format(n, i)
        if i <= 3 then
          -- RGB
          n = n * 255
        elseif i == 5 or i == 6 then
          -- S or L of HSL
          n = n * 100
        elseif i >= 7 then
          -- CMYK
          return ("%5.1f%%"):format(math.floor(n * 200) / 2)
        end
        return ("%6d"):format(n)
      end

      function RgbHslCmykInput.from_rgb(RGB)
        local HSL = convert.rgb2hsl(RGB)
        local CMYK = convert.rgb2cmyk(RGB)
        local R, G, B = unpack(RGB)
        local H, S, L = unpack(HSL)
        local C, M, Y, K = unpack(CMYK)
        return { R, G, B, H, S, L, C, M, Y, K }
      end

      function RgbHslCmykInput.to_rgb(value)
        return { value[1], value[2], value[3] }
      end

      function RgbHslCmykInput:_set_rgb(RGB)
        self.value[1] = RGB[1]
        self.value[2] = RGB[2]
        self.value[3] = RGB[3]
      end

      function RgbHslCmykInput:_set_hsl(HSL)
        self.value[4] = HSL[1]
        self.value[5] = HSL[2]
        self.value[6] = HSL[3]
      end

      function RgbHslCmykInput:_set_cmyk(CMYK)
        self.value[7] = CMYK[1]
        self.value[8] = CMYK[2]
        self.value[9] = CMYK[3]
        self.value[10] = CMYK[4]
      end

      function RgbHslCmykInput:callback(index, new_value)
        self.value[index] = new_value
        local v = self.value
        if index <= 3 then
          local RGB = { v[1], v[2], v[3] }
          local HSL = convert.rgb2hsl(RGB)
          local CMYK = convert.rgb2cmyk(RGB)
          self:_set_hsl(HSL)
          self:_set_cmyk(CMYK)
        elseif index <= 6 then
          local HSL = { v[4], v[5], v[6] }
          local RGB = convert.hsl2rgb(HSL)
          local CMYK = convert.rgb2cmyk(RGB)
          self:_set_rgb(RGB)
          self:_set_cmyk(CMYK)
        else
          local CMYK = { v[7], v[8], v[9], v[10] }
          local RGB = convert.cmyk2rgb(CMYK)
          local HSL = convert.rgb2hsl(RGB)
          self:_set_rgb(RGB)
          self:_set_hsl(HSL)
        end
      end

      local ccc = require("ccc")
      ccc.setup({
        inputs = {
          RgbHslCmykInput,
        },
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        outputs = {
          ccc.output.css_rgb,
          ccc.output.hex,
        }
      })
    end,
    keys = {
      { "<leader>cp", vim.cmd.CccPick,    desc = "Color picker" },
      { "<leader>ct", vim.cmd.CccConvert, desc = "Convert between color types" }
    }
  },
  {
    "nvzone/minty",
    dependencies = "nvzone/volt",
    cmd = { "Shades", "Huefy" }
  },

  -- collection of small plugins
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<Leader>lg", function() Snacks.lazygit.open() end, desc = "Open Lazygit window" }
    },
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      lazygit = { enabled = true },
    }
  },

  -- ???
  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>nvim", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "???" }
    }
  },

  -- typing test for fun
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- ansi escape sequence coloring
  {
    "Makaze/AnsiEsc",
    cmd = { "AnsiEsc" },
  }
}
