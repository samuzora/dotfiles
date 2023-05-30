return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- must load session before LSP
      "rmagatti/auto-session",

      "hrsh7th/cmp-nvim-lsp",
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
        "folke/neodev.nvim",
        config = true
      }
    },
    config = function()
      vim.keymap.set("v", "K", "<Nop>")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- for nvim-ufo
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = true,
        lineFoldingOnly = true
      }

      local lspconfig = require("lspconfig")

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end

      local handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            single_file_support = true,
            capabilities = capabilities,
          })
        end,
        ["tsserver"] = function()
          lspconfig.tsserver.setup {
            single_file_support = true,
            capabilities = capabilities,
            settings = {
              javascript = {
                format = {
                  semicolons = "remove"
                }
              }
            },
            commands = {
              OrganizeImports = {
                organize_imports,
                description = "Organize Imports"
              }
            }
          }
        end,
        ["typst_lsp"] = function()
          lspconfig.typst_lsp.setup {
            single_file_support = true,
            capabilities = capabilities,
            settings = { exportPdf = "never" }
          }
        end
      }
      require("mason-lspconfig").setup({ handlers = handlers })
    end,
    keys = {
      { "K",          vim.lsp.buf.hover,           desc = "Show documentation" },
      { "gc",         vim.lsp.buf.incoming_calls,  desc = "Jump to calls" },
      { "gd",         vim.lsp.buf.definition,      desc = "Jump to definition" },
      { "gD",         vim.lsp.buf.declaration,     desc = "Jump to declaration" },
      { "gi",         vim.lsp.buf.implementation,  desc = "Jump to implementation" },
      { "go",         vim.lsp.buf.type_definition, desc = "Jump to type definition" },
      { "gr",         vim.lsp.buf.references,      desc = "List references" },
      { "gl",         vim.diagnostic.open_float,   desc = "Show diagnostics in float" },
      { "<leader>la", vim.lsp.buf.code_action,     desc = "Execute LSP code action" },
      { "<leader>=",  vim.lsp.buf.format,          desc = "LSP format" }
    }
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    },
    keys = {
      { "gS", vim.lsp.buf.signature_help, desc = "Show signature" }
    }
  },

  -- lsp quickfix
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup()
    end,
    keys = {
      { "<leader>lf", ":TroubleToggle<CR>", desc = "View LSP diagnostics" }
    }
  },

  -- incremental rename
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "gn", ":IncRename ", desc = "Rename variable" }
    }
  },
}
