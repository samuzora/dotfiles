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
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local types = require('cmp.types')
      local compare = cmp.config.compare

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      ---@diagnostic disable-next-line: redundant-parameter
      cmp.setup({
        enabled = function()
          local in_prompt = vim.api.nvim_get_option_value("buftype", {}) == "prompt"
          if in_prompt then -- this will disable cmp in the Telescope window (taken from the default config)
            return false
          end
          local context = require("cmp.config.context")
          return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
        end,
        mapping = {
          ["<C-p>"] = cmp.mapping.complete(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
              })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping.confirm({
            select = true, behavior = cmp.ConfirmBehavior.Replace
          }),
          ["<C-y>"] = cmp.mapping.scroll_docs(-1),
          ["<C-e>"] = cmp.mapping.scroll_docs(1),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-c>"] = cmp.mapping.close()
        },
        sources = cmp.config.sources(
          {
            { name = "html-css" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" }
          }
        -- {
        --   { name = "buffer" }
        -- }
        ),
        matching = {
          disallow_fuzzy_matching = true,
          disallow_partial_matching = true,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            compare.exact,
            compare.locality,
            compare.recently_used,
            compare.scopes,
            compare.kind,
          }
        },
        snippet = {
          expand = function(args)
            require "luasnip".lsp_expand(args.body)
          end
        },
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
        experimental = {
          ghost_text = {
            enabled = true,
            hl_group = "Comment",
          }
        }
      })

      ---@diagnostic disable-next-line: undefined-field
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      ---@diagnostic disable-next-line: undefined-field
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

      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)
      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      vim.keymap.set('i', '<Tab>', function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { desc = "Super Tab" })
      require("copilot").setup({
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
            accept = false,
            accept_word = false,
            accept_line = false,
            next = "<Down>",
            prev = "<Up>",
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
      })
    end,
    -- opts = {},
    -- keys = {
    --   { "<Tab>", function()
    --     vim.notify("accepting suggestion")
    --     if require("copilot.suggestion").is_visible() then
    --       require("copilot.suggestion").accept()
    --     else
    --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    --     end
    --   end, { desc = "Copilot super tab", mode = { "i", "v" } }
    --   }
    -- }
  },
}
