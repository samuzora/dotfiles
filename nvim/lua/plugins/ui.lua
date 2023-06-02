return {
  -- noice, nui and notify
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "noice".setup {
        -- messages = {
        --   view_error = true,
        -- },
        views = {
          hover = {
            border = {
              style = "rounded"
            }
          },
          cmdline_popup = {
            position = {
              row = "90%",
              col = "50%",
            }
          }
        },
        lsp = {
          hover = { enabled = false },
          signature = { enabled = false },
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
      }

      local stages_util = require("notify.stages.util")

      require "notify".setup {
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
      }
      vim.keymap.set("n", "<leader>nd", require("notify").dismiss)
    end,
    event = "VimEnter",
    keys = {
      { "<leader>nd", function() require("notify").dismiss() end, "Dismiss all notifications" },
    }
  },

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.o.background = "dark"
      require "tokyonight".setup {
        style = "night",
        light_style = "day",
        transparent = false,
        on_highlights = function(hl, c)
          hl.WinSeparator = {
            fg = c.fg_dark
          }
        end
      }
      vim.cmd [[colorscheme tokyonight]]
    end
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/noice.nvim",
    },
    config = function()
      -- Eviline config for lualine
      -- Author: shadmansaleh
      -- Credit: glepnir
      local lualine = require('lualine')

      -- Color table for highlights
      -- stylua: ignore
      local colors = {}
      if (vim.o.background == 'dark') then
        colors = {
          bg = nil,
          fg = "#c0caf5",
          yellow = "#e0af68",
          cyan = "#7dcfff",
          darkblue = "#3d59a1",
          green = "#9ece6a",
          orange = "#ff9e64",
          violet = "#9d7cd8",
          magenta = "#bb9af7",
          blue = "#2ac3de",
          red = "#f7768e",
        }
      elseif (vim.o.background == 'light') then
        colors = {
          bg = "#e1e2e7",
          fg = "#3760bf",
          yellow = "#8c6c3e",
          cyan = "#007197",
          darkblue = "#2e7de9",
          green = "#587539",
          orange = "#ea894f",
          violet = "#7847bd",
          magenta = "#9854f1",
          blue = "#2ac3de",
          red = "#f52a65",
        }
      end

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      -- Config
      local config = {
        options = {
          globalstatus = true,
          -- Disable sections and component separators
          component_separators = '',
          section_separators = '',
          theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left {
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta, gui = 'bold' },
      }

      ins_left {
        -- filesize component
        'filesize',
        cond = conditions.buffer_not_empty,
        color = { gui = 'bold' }
      }

      ins_left {
        'location',
        color = { fg = colors.yellow }
      }

      ins_left {
        'progress',
        color = { fg = colors.yellow, gui = 'bold' }
      }

      ins_left {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      }

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left {
        function()
          return "%="
        end,
      }

      ins_left {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = colors.orange },
      }

      ins_left {
        -- mode component
        function()
          return vim.fn.mode()
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      }

      -- Add components to right sections
      ins_left {
        'branch',
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
      }

      ins_left {
        'diff',
        -- Is it me or the symbol for modified us really weird
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      ins_right {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option()
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { fg = colors.fg, gui = 'bold' },
      }


      -- Now don't forget to initialize lualine
      lualine.setup(config)
    end
  },

  -- barbar
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
      { "<A-<>", ":BufferMovePrevious<CR>", desc = "Move to previous buffer" },
      { "<A->>", ":BufferMoveNext<CR>",     desc = "Move to next buffer" },
      { "<A-,>", ":BufferPrevious<CR>",     desc = "Go to previous buffer" },
      { "<A-.>", ":BufferNext<CR>",         desc = "Go to next buffer" },
      { "<A-1>", ":BufferGoto 1<CR>",       desc = "Go to buffer 1" },
      { "<A-2>", ":BufferGoto 2<CR>",       desc = "Go to buffer 2" },
      { "<A-3>", ":BufferGoto 3<CR>",       desc = "Go to buffer 3" },
      { "<A-4>", ":BufferGoto 4<CR>",       desc = "Go to buffer 4" },
      { "<A-5>", ":BufferGoto 5<CR>",       desc = "Go to buffer 5" },
      { "<A-6>", ":BufferGoto 6<CR>",       desc = "Go to buffer 6" },
      { "<A-7>", ":BufferGoto 7<CR>",       desc = "Go to buffer 7" },
      { "<A-8>", ":BufferGoto 8<CR>",       desc = "Go to buffer 8" },
      { "<A-9>", ":BufferGoto 9<CR>",       desc = "Go to buffer 9" },
      { "<A-0>", ":BufferLast<CR>",         desc = "Go to last buffer 1" },
      { "<A-p>", ":BufferPin<CR>",          desc = "Pin buffer" },
      { "<A-c>", ":BufferClose<CR>",        desc = "Close buffer" }
    }
  },

  -- smooth scrolling and other animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = {
      cursor = {
        enable = false
      }
    }
  },

  -- automatic window resizing
  {
    "camspiers/lens.vim",
    event = "VeryLazy",
    dependencies = {
      "camspiers/animate.vim"
    },
  },

  -- expensive flower (for ray-x/navigator.lua)
  {
    "ray-x/guihua.lua",
    lazy = true,
    main = "guihua.maps",
    build = "cd lua/fzy && make",
    opts = {
      close_view = "<esc>",
    }
  },


  -- undo tree
  {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", desc = "Toggle undo tree" }
    }
  },

  -- memory loss
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        }
      }
    }
  },

  -- indentline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      use_treesitter = true,
      indent_level = 99,
      show_current_context = true,
    }
  },

  -- hex colours
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufRead",
    config = true
  },
  {
    "ziontee113/color-picker.nvim",
    opts = {
      border = "rounded",
      icons = { "-", ">" },
      keymap = {
        b = "<Plug>ColorPickerSlider10Decrease",
      }
    },
    keys = {
      { "<leader>c", ":PickColor<CR>", desc = "Colour picker" }
    }
  },

  -- code map
  {
    "echasnovski/mini.map",
    config = function()
      require("mini.map").setup({
        integrations = {
          require "mini.map".gen_integration.builtin_search(),
          require "mini.map".gen_integration.gitsigns(),
          require "mini.map".gen_integration.diagnostic(),
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
      { "<leader>mo", function() require "mini.map".open() end,         desc = "Open minimap" },
      { "<leader>mc", function() require "mini.map".close() end,        desc = "Open minimap" },
      { "<leader>mm", function() require "mini.map".toggle() end,       desc = "Toggle minimap" },
      { "<leader>mf", function() require "mini.map".toggle_focus() end, desc = "Focus minimap" },
      { "<leader>mr", function() require "mini.map".refresh() end,      desc = "Open minimap" },
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
              width = .90
            }
          })
        end,
        desc = "zen mode"
      }
    }
  },

  -- ??
  {
    "Eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>vim", ":CellularAutomaton make_it_rain<CR>", desc = "Rain" }
    },
  },
}
