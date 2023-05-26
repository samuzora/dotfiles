return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    event = "VeryLazy",
    config = function()
      vim.keymap.set("v", "K", "<Nop>")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            single_file_support = true,
            capabilities = capabilities,
          })
        end,
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
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
          }
        }
      })
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

  -- list lsp errors etc
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

  -- mason
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = {
        border = "rounded"
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {}
    }
  },


  -- incremental rename using LSP
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      { "gn", ":IncRename ", desc = "Rename variable" }
    }
  },
}
