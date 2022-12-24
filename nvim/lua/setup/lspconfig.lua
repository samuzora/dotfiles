local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lsp-format").setup({})

local lspconfig = require('lspconfig')

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

lspconfig.prismals.setup({})

lspconfig.texlab.setup({
  single_file_support = true,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  single_file_support = true,
  on_attach = require("lsp-format").on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lspconfig.ccls.setup({})

require("trouble").setup()
