return {
  -- lsp interfaces
  {
    "ray-x/navigator.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ray-x/guihua.lua",
      "ray-x/lsp_signature.nvim",

      "hrsh7th/cmp-nvim-lsp",
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",

      -- mason
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            border = "rounded"
          }
        }
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {}
        }
      },

      {
        "smjonas/inc-rename.nvim",
        config = true,
        keys = {
          { "<Leader>rn", ":IncRename ", desc = "Rename variable" },
        }
      },
    },
    event = "VeryLazy",
    config = function()
      require "navigator".setup {
        lsp = {
          format_on_save = false,
          format_options = { async = true },
          servers = { "typst_lsp", "prismals" },
          typst_lsp = {
            settings = {
              exportPdf = false
            },
          }
        },
        icons = {
          icons = true,
          diagnostic_err = "💀",
          diagnostic_warn = "👎",
          diagnostic_info = "🤓",
          diagnostic_hint = "😉",

          diagnostic_head_severity_1 = "💀 ",
          diagnostic_head_severity_2 = "😡 ",
          diagnostic_head_severity_3 = "👎 ",
          diagnostic_head_description = "",
          diagnostic_virtual_text = "",
        },
        lsp_signature_help = true,
        signature_help_cfg = {
          bind = true,
          hint_inline = function() return true end,
          handler_opts = {
            border = "rounded"
          }
        },
        mason = true,
        default_mapping = false,
        keymaps = {
          {
            key = "gr",
            func = require("navigator.reference").async_ref,
            desc = "Show references"
          },
          {
            key = "<C-k>",
            func = vim.lsp.buf.signature_help,
            desc = "Show signature help"
          },
          {
            key = "g0",
            func = require("navigator.symbols").document_symbols,
            desc = "Show all symbols in document"
          },
          {
            key = "gW",
            func = require("navigator.workspace").workspace_symbol_live,
            desc = "Show all symbols in workspace"
          },
          {
            key = "gd",
            func = require("navigator.definition").definition_preview,
            desc = "Preview definition"
          },
          {
            key = "gD",
            func = vim.lsp.buf.definition,
            desc = "Go to definition"
          },
          {
            key = "gT",
            func = require("navigator.definition").type_definition_preview,
            desc = "Preview type definition"
          },
          {
            key = "gT",
            func = vim.lsp.buf.type_definition,
            desc = "Go to type definition"
          },
          {
            key = "gi",
            func = vim.lsp.buf.implementation,
            desc = "Go to implementation"
          },
          {
            key = "ga",
            func = require("navigator.codeAction").code_action,
            mode = "n",
            desc = "Execute code action"
          },
          {
            key = "ga",
            func = require("navigator.codeAction").range_code_action,
            mode = "v",
            desc = "Execute code action on selection"
          },
          {
            key = "gI",
            func = vim.lsp.buf.incoming_calls,
            desc = "Show incoming calls"
          },
          {
            key = "gO",
            func = vim.lsp.buf.outgoing_calls,
            desc = "Show outgoing calls"
          },
          {
            key = "gf",
            func = require("navigator.diagnostics").show_line_diagnostics,
            desc = "Preview line diagnostics"
          },
          {
            key = "gl",
            func = require("navigator.diagnostics").show_buf_diagnostics,
            desc = "Show buffer diagnostics"
          },
          {
            key = "gL",
            func = require("navigator.diagnostics").show_diagnostics,
            desc = "Show workspace diagnostics"
          },
          {
            key = "]d",
            func = vim.diagnostic.goto_next,
            desc = "Go to next diagnostic"
          },
          {
            key = "[d",
            func = vim.diagnostic.goto_prev,
            desc = "Go to previous diagnostic"
          },
          {
            key = "gq",
            func = vim.diagnostic.set_loclist,
            desc = "Show diagnostics in a quickfix"
          },
          {
            key = "==",
            func = function() vim.lsp.buf.format { async = true } end,
            mode = "n",
            desc = "Format buffer"
          },
          {
            key = "==",
            func = vim.lsp.buf.range_format,
            mode = "n",
            desc = "Format selection"
          },
          {
            key = "gk",
            func = require("navigator.dochighlight").hi_symbol,
            desc = "Highlight symbol under cursor"
          },
          {
            key = "<Leader>la",
            func = require("navigator.codelens").run_action,
            desc = "Run code lens on line under cursor"
          },
        },
      }
    end,
  },

  -- special neovim lsp
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = true
  }
}
