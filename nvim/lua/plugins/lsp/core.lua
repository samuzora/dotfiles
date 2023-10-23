return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded"
        }
      },
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")

    local function on_attach(client, bufnr)
      -- any code i want to run on attach
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local default_lsp_config = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 200,
        allow_incremental_sync = true,
      },
    }

    local servers = {
      clangd = {
        single_file_support = true,
      },
      lua_ls = {},
      intelephense = {
        single_file_support = true,
      },
      jedi_language_server = {
        single_file_support = true,
      },
      ruff_lsp = {
        single_file_support = true,
        settings = {
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
      typst_lsp = {
        single_file_support = true,
        settings = {
          exportPdf = "never",
        }
      },
      texlab = {},
      prismals = {},
      cssls = {},
      gopls = {},
    }

    local server_names = {}
    for server, _ in pairs(servers) do
      table.insert(server_names, server)
    end

    -- setup all servers specified above
    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
    end
  end,
}
