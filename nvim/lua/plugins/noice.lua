local M = {
  "folke/noice.nvim",
  event = "VimEnter",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

function M.config()
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
end

return M
