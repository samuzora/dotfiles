-- noice, nui and notify
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require "noice".setup {
      redirect = {
        view = "popup"
      },
      views = {
        cmdline_popup = {
          position = {
            row = "90%",
            col = "50%",
          }
        },
        lsp = {
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
    }
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

    require "notify".setup {
      timeout = 3,
      fps = 240,
    }
  end,
  keys = {
    { "dn", function() require("notify").dismiss() end, desc = "Dismiss all notifications" },
  }
}
