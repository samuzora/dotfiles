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
          if in_prompt then -- disable cmp in Telescope
            return false
          end
          local context = require("cmp.config.context")
          -- disable cmp in comments
          return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
        end,
        mapping = {
          -- manually trigger completion menu
          ["<C-p>"] = cmp.mapping.complete(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),

          ["<C-y>"] = cmp.mapping.scroll_docs(-1),
          ["<C-e>"] = cmp.mapping.scroll_docs(1),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- close completion menu
          ["<C-c>"] = cmp.mapping.close(),

          -- Super-tab mapping
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- local copilot = require("copilot.suggestion")
            if cmp.visible() then
              -- regular selection
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
              })
            -- elseif copilot.is_visible() then
            --   copilot.accept()
            elseif luasnip.expand_or_locally_jumpable() then
              -- trigger snippet
              luasnip.expand_or_jump()
            elseif has_words_before() then
              -- if non-whitespace before cursor, trigger completion menu
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- consume word after cursor (<Tab> behaviour is to prepend to it)
              cmp.confirm({
                select = true, behavior = cmp.ConfirmBehavior.Replace
              })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end),
        },
        sources = cmp.config.sources(
          {
            { name = "html-css" },
            { name = "nvim_lsp" },
            { name = "emoji" },
            { name = "luasnip" },
            { name = "path" }
          }
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
    end
  },

  {
    "saghen/blink.cmp",
    enabled = false,
    event = "VeryLazy",
    dependencies = "rafamadriz/friendly-snippets",
    version = 'v0.*',
    -- build = "cargo build --release",

    opts = {
      keymap = {
        -- TODO when toggling is supported, change to the same keybind as show
        hide = "<C-e>",
        select_prev = { "<Up>", "<C-k>" },
        select_next = { "<Down>", "<C-j>" },
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
    }
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local ls = require "luasnip"

      require "luasnip".setup {
        update_events = { "TextChanged", "TextChangedI" },
        -- region_check_events = { "CursorMoved" },
        delete_check_events = { "TextChanged" },
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      }

      -- vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
      -- vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })

      -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
      --   if ls.choice_active() then
      --     return ls.change_choice(1)
      --   end
      -- end, { noremap = true })
      --
      -- vim.keymap.set({ "i", "s" }, "<C-k>", function()
      --   if ls.choice_active() then
      --     return ls.change_choice(-1)
      --   end
      -- end, { noremap = true })

      require "luasnip.loaders.from_vscode".lazy_load()
      require "luasnip.loaders.from_lua".lazy_load { paths = { "~/.config/nvim/lua/plugins/snippets" } }
    end
  },

  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
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
            open = "<C-g>",
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
            -- for nvim-cmp
            -- accept = false,
            accept = "<C-c>",
            accept_word = false,
            accept_line = false,
            next = "<Down>",
            prev = "<Up>",
          }
        },
      })

      -- for nvim-cmp
      -- local cmp = require("cmp")
      -- cmp.event:on("menu_opened",
      --   function()
      --     vim.b.copilot_suggestion_hidden = true
      --   end
      -- )
      -- cmp.event:on("menu_closed",
      --   function()
      --     vim.b.copilot_suggestion_hidden = false
      --   end
      -- )
    end,
  },
}
