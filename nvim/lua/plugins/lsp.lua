return {
  -- lsp interface
  {
    "ray-x/navigator.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ray-x/guihua.lua",
      "ray-x/lsp_signature.nvim",

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
        height = 0.5,
        preview_height = 0.5,
        lsp = {
          format_on_save = false,
          format_options = { async = true },
          servers = { "typst_lsp", "prismals", "jedi_language_server", "ruff_lsp" },
          hover = {
            enable = true,
            keymap = {
              ["<C-k>"] = {
                default = {
                  function()
                    local w = vim.fn.expand("<cWORD>")
                    vim.lsp.buf.workspace_symbols(w)
                  end,
                },
              },
            },
          },
          display_diagnostic_qf = false,
          typst_lsp = {
            single_file = true,
            settings = {
              exportPdf = false
            },
          },
          ruff_lsp = {
            settings = {
              -- lint settings found at .config/ruff/ruff.toml
              codeAction = {
                fixViolation = {
                  enable = false,
                },
                disableRuleComment = {
                  enable = false,
                },
              }
            }
          },
          flow = {
            filetypes = {},
          },
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
          transparency = 30,
          floating_window_above_cur_line = true,
          toggle_key = "<M-x>",
          handler_opts = {
            border = "rounded"
          }
        },
        ts_fold = false,
        mason = true,
        default_mapping = false,
        keymaps = {
          {
            key = "Kr",
            func = require("navigator.reference").async_ref,
            desc = "Show references"
          },
          {
            key = "Kk",
            func = vim.lsp.buf.hover,
            desc = "LSP hover"
          },
          {
            key = "KK",
            func = vim.lsp.buf.signature_help,
            desc = "Show signature help"
          },
          {
            key = "Ks",
            func = require("navigator.symbols").document_symbols,
            desc = "Show all symbols in document"
          },
          {
            key = "KS",
            func = require("navigator.workspace").workspace_symbol_live,
            desc = "Show all symbols in workspace"
          },
          {
            key = "Kd",
            func = require("navigator.definition").definition_preview,
            desc = "Preview definition"
          },
          {
            key = "KD",
            func = vim.lsp.buf.definition,
            desc = "Go to definition"
          },
          {
            key = "Kt",
            func = require("navigator.definition").type_definition_preview,
            desc = "Preview type definition"
          },
          {
            key = "KT",
            func = vim.lsp.buf.type_definition,
            desc = "Go to type definition"
          },
          {
            key = "Ki",
            func = vim.lsp.buf.implementation,
            desc = "Go to implementation"
          },
          {
            key = "Ka",
            func = require("navigator.codeAction").code_action,
            mode = "n",
            desc = "Execute code action"
          },
          {
            key = "Ka",
            func = require("navigator.codeAction").range_code_action,
            mode = "v",
            desc = "Execute code action on selection"
          },
          {
            key = "K?",
            func = vim.lsp.buf.incoming_calls,
            desc = "Show incoming calls"
          },
          {
            key = "K!",
            func = vim.lsp.buf.outgoing_calls,
            desc = "Show outgoing calls"
          },
          {
            key = "Kl",
            func = require("navigator.diagnostics").show_diagnostics,
            desc = "Show line diagnostics"
          },
          {
            key = "KL",
            func = require("navigator.diagnostics").show_buf_diagnostics,
            desc = "Show workspace diagnostics"
          },
          {
            key = "Kq",
            func = vim.diagnostic.loclist,
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
            key = "Kh",
            func = require("navigator.dochighlight").hi_symbol,
            desc = "Highlight symbol under cursor"
          },
          {
            key = "Kc",
            func = require("navigator.codelens").run_action,
            desc = "Run code lens on line under cursor"
          },
        },
      }
      require "guihua.maps".setup {
        close_view = "<Esc>",
        save = ":w",
      }
      vim.api.nvim_set_keymap("", "K", "", {})
    end,
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      filetypes = {
        javascript = true,
        typescript = true,
        lua = true,
        python = true,
        rust = true,
        go = true,
        c = true,
        cpp = true,
        java = true,
        ["*"] = false
      },
      panel = {
        auto_refresh = true,
        keymap = {
          open = "<C-Left>",
        },
        layout = {
          position = "left",
          ratio = 0.4
        }
      },
      suggestion = {
        auto_trigger = true,
        debounce = 20,
        keymap = {
          accept = "<Right>",
          accept_word = "<C-Right>",
          accept_line = "<M-Right>",
          next = "<M-]>",
          prev = "<M-[>",
        }
      }
    },
  },

  -- special neovim lsp
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = true
  }
}
