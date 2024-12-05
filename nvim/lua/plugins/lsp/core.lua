local servers = {
  astro = {},
  tailwindcss = {},
  vuels = {},

  clangd = {
    single_file_support = true,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  },
  lua_ls = {},
  intelephense = {
    init_options = {
      globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense'
    },
    single_file_support = true,
  },
  basedpyright = {
    single_file_support = true,
    settings = {
      basedpyright = {
        typeCheckingMode = "basic",
        analysis = {
          diagnosticSeverityOverrides = {
            reportUnusedCallResult = "none",
            reportReturnType = "none",
            reportWildcardImportFromLibrary = "none",
            reportUnknownParameterType = "none",
            reportUnknownVariableType = "none",
            reportAny = "none",
          }
        }
      },
    }
  },
  tinymist = {
    on_attach = function()
      -- pin current buffer to main file
      vim.api.nvim_create_user_command(
        "TypstPin",
        function()
          vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } })
        end,
        { desc = "Pin main file to tinymist" }
      )
      vim.api.nvim_create_user_command(
        "TypstUnpin",
        function()
          vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { nil } })
        end,
        { desc = "Unpin main file from tinymist" }
      )
    end
  },
  -- typst_lsp = {
  --   single_file_support = true,
  --   settings = {
  --     exportPdf = "never",
  --   },
  --   on_attach = function()
  --     -- pin current buffer to main file
  --     vim.api.nvim_create_user_command(
  --       "TypstPin",
  --       function()
  --         local filename = vim.api.nvim_buf_get_name(0)
  --         local uri = "file://" .. filename
  --         local params = { command = "typst-lsp.doPinMain", arguments = { uri }, title = '' }
  --         vim.lsp.buf_request(0, "workspace/executeCommand", params,
  --           function(err, result, context, config)
  --             if err then,
  --               vim.notify(err.message, "error")
  --             else
  --               vim.notify("Pinned " .. filename .. " to main", "info")
  --             end
  --           end
  --         )
  --       end,
  --       { desc = "Pin main file to typst-lsp" }
  --     )
  --
  --     vim.api.nvim_create_user_command(
  --       "TypstUnpin",
  --       function()
  --         local params = { command = "typst-lsp.doPinMain", arguments = { "detached" }, title = '' }
  --         vim.lsp.buf_request(0, "workspace/executeCommand", params,
  --           function(err, result, context, config)
  --             if err then
  --               vim.notify(err.message, "error")
  --             else
  --               vim.notify("Unpinned main file")
  --             end
  --           end
  --         )
  --       end,
  --       { desc = "Unpin main file from typst-lsp" }
  --     )
  --   end
  -- },
  -- yamlls = {
  --   capabilities = {
  --     textDocument = {
  --       foldingRange = {
  --         dynamicRegistration = false,
  --         lineFoldingOnly = true,
  --       },
  --     },
  --   },
  --   settings = {
  --     yaml = {
  --       format = {
  --         enable = false
  --       },
  --       validate = {
  --         enable = false
  --       },
  --       hover = {
  --         enable = false
  --       },
  --       completion = {
  --         enable = false
  --       },
  --     }
  --   }
  -- },
  solidity = {},
  prismals = {},
  cssls = {},
  gopls = {},
}

local server_names = {}
for server, _ in pairs(servers) do
  table.insert(server_names, server)
end

-- nushell lsp config
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.nu" },
  callback = function()
    if vim.fn.executable('nu') == 1 then
      vim.lsp.start({
        name = "nu-lsp",
        cmd = { "nu", "--lsp" },
      })
    end
  end
})

return {
  "neovim/nvim-lspconfig",
  -- lazy = false, -- don't set to true - it breaks single_file_mode!!
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded"
        }
      },
    },
    -- "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    -- border
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local lspconfig = require("lspconfig")

    local function on_attach(client, bufnr)
      -- any code to run on startup
    end

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- capabilities.textDocument.completion.completionItem.snippetSupport = true
    --
    local default_lsp_config = {
      on_attach = on_attach,
      -- capabilities = capabilities,
      flags = {
        -- debounce_text_changes = 200,
        allow_incremental_sync = true,
      },
    }

    -- setup all servers specified above
    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
    end
  end,
}
