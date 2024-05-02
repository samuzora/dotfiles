return {
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      "folke/noice.nvim",
      -- "AckslD/swenv.nvim",
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
        path = 1,
        cond = function() return vim.bo.filetype ~= "oil" end,
        color = { fg = colors.magenta, gui = 'bold' },
        shorting_target = 50,
      }
      ins_left {
        function() return require("oil").get_current_dir() end,
        cond = function() return vim.bo.filetype == "oil" end,
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
      -- ins_right {
      --   'swenv',
      --   icon = "venv:",
      --   color = { fg = colors.green },
      --   cond = function()
      --     return vim.bo.filetype == "python"
      --   end,
      -- }

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
    event = "UIEnter",
    config = function()
      vim.o.showtabline = 2
      require('tabby.tabline').use_preset('active_wins_at_tail', {
        theme = {
          fill = "TabLineFill",
          head = "TabLine",
          current_tab = "TabLineSel",
          tab = "TabLine",
          win = "TabLine",
          tail = "TabLine",
        },
        tab_name = {
          name_fallback = function(tabid) return "Tab " .. tabid end,
        },
        buf_name = {
          mode = "'unique'|'relative'|'tail'|'shorten'",
        },
      })
    end
  },

  -- keymap view
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        registers = false,
        spelling = {
          enabled = true,
        }
      }
    }
  },

  -- nicer lists for various stuff
  {
    "folke/trouble.nvim",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>dd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Buffer diagnostics" },
      { "<leader>dw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace diagnostics" },
    },
    opts = {
      position = "bottom",
      auto_fold = { "document_diagnostics", "workspace_diagnostics", "lsp_type_definitions", "loclist" },
      auto_preview = true,
    },
  },

  -- very cool ui
  {
    "folke/noice.nvim",
    keys = {
      { "<C-l>", function()
        require("notify").dismiss()
        vim.cmd[[noh]]
        vim.cmd[[diffupdate]]
      end, desc = "Refresh screen and clear notifications"
      }
    },
    event = "UIEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          stages = "fade",
          render = "wrapped-compact",
          max_width = "100",
        }
      },
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      -- scrolling in lsp docs
      vim.keymap.set({ "n", "i" }, "<c-e>",
        function()
          if not require("noice.lsp").scroll(1) then
            return "<c-e>"
          end
        end,
        { silent = true, expr = true }
      )
      vim.keymap.set({ "n", "i" }, "<c-y>",
        function()
          if not require("noice.lsp").scroll(-1) then
            return "<c-y>"
          end
        end,
        { silent = true, expr = true }
      )
      vim.keymap.set({ "n", "i" }, "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        { silent = true, expr = true }
      )
      vim.keymap.set({ "n", "i" }, "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        { silent = true, expr = true }
      )
      vim.keymap.set({ "n", "i" }, "<c-d>",
        function()
          if not require("noice.lsp").scroll(10) then
            return "<c-d>"
          end
        end,
        { silent = true, expr = true }
      )
      vim.keymap.set({ "n", "i" }, "<c-u>",
        function()
          if not require("noice.lsp").scroll(-10) then
            return "<c-u>"
          end
        end,
        { silent = true, expr = true }
      )

      -- edit cmdline in popup
      vim.keymap.set("c", "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        { desc = "Redirect cmdline to popup window" }
      )
    end,
    opts = {
      -- some presets
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = false,
      },

      -- when calling require("noice").redirect(<command>), the output will appear in a popup
      redirect = {
        view = "popup"
      },

      -- use notify as notifications backend
      notify = {
        view = "notify",
      },

      -- notifications filtering
      routes = {
        -- move any notifications longer than 10 lines to a split window
        -- these only apply to "msg_show" events (check :h ui-messages) for list of events
        {
          view = "split",
          filter = {
            event = "msg_show", min_height = 10
          }
        },

        -- don't show notifications matching these
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" }, -- on deleting lines
              { find = "%d more lines" }, -- on pasting lines
              { find = "\"%s\" %dL, %dB written" }, -- file write notification
            },
          },
          opts = { view = true },
        }
      },

      -- other ui components
      views = {
        -- cmdline
        cmdline_popup = {
          position = {
            row = "90%",
            col = "50%",
          }
        },

        lsp = {
          -- lsp docs
          documentation = {
            win_options = {
              concealcursor = 'n',
              conceallevel = 3,
              winhighlight = {
                Normal = 'PMenu',
                FloatBorder = 'PMenu',
              },
            },
          },

          -- function signature
          signature = {
            enabled = true
          }
        },
      }
    }
  }
}
