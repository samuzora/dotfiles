return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/trouble.nvim",
        config = function()
          require("trouble").setup()
        end,
        keys = {
          { "<leader>lf", ":TroubleToggle<CR>", desc = "View LSP diagnostics" }
        }
      },
      {
        "lukas-reineke/lsp-format.nvim",
        config = function()
          require("lsp-format").setup({})
        end
      }
    },
    config = function()
      require("mason")

      local lspconfig = require("lspconfig")

      vim.keymap.set("v", "K", "<Nop>")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      lspconfig.pyright.setup({
        single_file_support = true,
        capabilities = capabilities,
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            signs = false,
            underline = false,
          })
        },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticSeverityOverrides = {
                reportWildcardImportFromLibrary = "none",
              },
            },
          },
        },
      })

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end

      lspconfig.tsserver.setup({
        single_file_support = true,
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          require("lsp-format").on_attach(client, bufnr)
        end,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
          }
        }
      })

      lspconfig.jdtls.setup({
        single_file_support = true,
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          require("lsp-format").on_attach(client, bufnr)
        end,
      })

      capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.clangd.setup({
        single_file_support = true,
        capabilities = capabilities,
      })

      lspconfig.intelephense.setup({
        single_file_support = true,
        capabilities = capabilities,
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      lspconfig.texlab.setup({
        single_file_support = true,
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        single_file_support = true,
        capabilities = capabilities,
        on_attach = require("lsp-format").on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
    end,
    keys = {
      { "<leader>la", vim.lsp.buf.code_action, desc = "Execute LSP code action" },
      { "gd",         vim.lsp.buf.definition,  desc = "View LSP definition" },
      { "gr",         vim.lsp.buf.references,  desc = "Jump to LSP references" },
      { "K",          vim.lsp.buf.hover,       desc = "Peek at LSP docs" }
    }
  },

  -- mason
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded"
        }
      })
      require("mason-lspconfig").setup({
        automatic_installation = true
      })
    end
  },
}
