vim.o.updatetime = 0

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",

      "L3MON4D3/LuaSnip",

      "onsails/lspkind.nvim",
    },

    config = function()
      local cmp = require('cmp')

      ---@diagnostic disable-next-line: redundant-parameter
      cmp.setup({
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
          end,
        },
        sorting = {
          priority_weight = 1,
          comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.score,
            cmp.config.compare.offset,
            cmp.config.compare.order,
          }
        },
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
            col_offset = -3,
            side_padding = 0,
          },
          documentation = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
          }
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.complete(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-c>"] = cmp.mapping.close()
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 3 },
          { name = "luasnip",  priority = 2 },
          { name = "path",     priority = 1 }
        }),
        snippet = {
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
          end
        }
      })

      ---@diagnostic disable-next-line: redundant-parameter
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      ---@diagnostic disable-next-line: redundant-parameter
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!', 'read' }
            }
          },
        }),
      })
    end
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      filetypes = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        lua = true,
        python = true,
        rust = true,
        go = true,
        c = true,
        cpp = true,
        java = true,
        typst = true,
        markdown = true,
        sh = true,
        yaml = true,
        txt = true,
      },
      panel = {
        auto_refresh = true,
        keymap = {
          open = "<C-s>",
        },
        layout = {
          position = "bottom",
          ratio = 0.3
        }
      },
      suggestion = {
        auto_trigger = true,
        debounce = 20,
        keymap = {
          accept = "<Right>",
          accept_word = false,
          accept_line = false,
          next = "<M-Right>",
          prev = "<M-Left>",
        }
      },
      server_opts_overrides = {
        settings = {
          advanced = {
            listCount = 10,
            inlineSuggestCount = 10,
          }
        },
      }
    },
  }
}
