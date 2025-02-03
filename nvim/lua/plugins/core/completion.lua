vim.o.updatetime = 0

return {
  {
    "saghen/blink.cmp",
    event = "VeryLazy",
    version = "*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
      end,
      keymap = {
        ["<C-n>"] = { "show", "hide" },
        ["<C-p>"] = { "show_documentation", "hide_documentation" },

        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-l>"] = { "select_and_accept", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" }
          }
        },
        ghost_text = {
          enabled = true
        },
      }
    }
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
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
    end,
  },
}
