return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",

      "L3MON4D3/LuaSnip",
    },

    event = "VeryLazy",
    config = function()
      local cmp = require 'cmp'

      vim.o.updatetime = 100
      vim.o.pumblend = 30

      vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
        group = vim.api.nvim_create_augroup("cmp_complete_on_space", {}),
        callback = function()
          local line = vim.api.nvim_get_current_line()
          local cursor = vim.api.nvim_win_get_cursor(0)[2]

          if string.sub(line, cursor, cursor + 1) == " " then
            require("cmp").complete()
          end
        end,
      })

      ---@diagnostic disable-next-line: redundant-parameter
      cmp.setup({
        perfomance = {
          debounce = 0,
          throttle = 0
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          }
        },
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = function(entry, item)
            local short_name = {
              nvim_lsp = "LSP",
              nvim_lua = "nvim",
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format("[%s]", menu_name)
            return item
          end
        },

        completion = {
          completeopt = "menu,menuone,noselect"
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" }
        }),
        snippet = {
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
          end
        }
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

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
  }
}
