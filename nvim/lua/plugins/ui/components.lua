return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/noice.nvim",
      "rmagatti/auto-session",
    },
    config = function()
      local lualine = require('lualine')

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

      local config = {
        options = {
          globalstatus = true,
          component_separators = '',
          section_separators = '',
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left {
        'branch',
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
      }

      ins_left {
        'diff',
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      ins_left {
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta, gui = 'bold' },
      }

      ins_left {
        'filesize',
        cond = conditions.buffer_not_empty,
        color = { gui = 'bold' }
      }

      ins_left {
        'location',
        color = { fg = colors.yellow }
      }

      ins_left {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = colors.orange },
      }

      -- python venv
      ins_right {
        'swenv',
        icon = "venv:",
        color = { fg = colors.green }
      }

      -- session
      ins_right {
        require('auto-session.lib').current_session_name,
        color = { fg = colors.green }
      }

      ins_right {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      }

      ins_right {
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local msg = ""
          local clients = vim.lsp.get_clients({ bufnr = bufnr })

          if next(clients) == nil then
            return "offline"
          end

          for i, client in ipairs(clients) do
            msg = msg .. client.name

            if i < #clients then
              msg = msg .. ", "
            end
          end

          return msg
        end,
        icon = ' LSP:',
        color = { fg = colors.fg, gui = 'bold' },
      }

      ins_right {
        "mode",
        color = function()
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
        padding = { left = 1 },
      }
      lualine.setup(config)
    end
  },

  -- tabline
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.showtabline = 2
      require('tabby.tabline').use_preset('active_wins_at_tail', {
        theme = {
          fill = 'TabLineFill',       -- tabline background
          head = 'TabLine',           -- head element highlight
          current_tab = 'TabLineSel', -- current tab label highlight
          tab = 'TabLine',            -- other tab label highlight
          win = 'TabLine',            -- window highlight
          tail = 'TabLine',           -- tail element highlight
        },
        nerdfont = true,              -- whether use nerdfont
        tab_name = {
          name_fallback = function(tabid) return "Workspace " .. tabid end,
        },
        buf_name = {
          mode = "'unique'|'relative'|'tail'|'shorten'",
        },
      })
    end
  },
}
