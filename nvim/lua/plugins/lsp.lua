return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      local function on_attach(client, bufnr)
        -- any code i want to run on attach (none so far)
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
        tsserver = {
          settings = {
            suggest = {
              autoImports = false,
            }
          }
        },
        lua_ls = {},
        rust_analyzer = {
          single_file_support = true,
        },
        jedi_language_server = {
          single_file_support = true,
        },
        ruff_lsp = {
          single_file_support = true,
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
        typst_lsp = {
          settings = {
            exportPdf = false,
          },
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

      require("mason-lspconfig").setup {
        automatic_installation = true,
      }

      -- setup all servers specified above
      for server, config in pairs(servers) do
        lspconfig[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
      end
    end,
    keys = {
      { "gk", "<cmd>Lspsaga hover_doc<CR>",                       desc = "LSP hover" },
      { "gK", "<cmd>Lspsaga hover_doc ++keep<CR>",                desc = "LSP hover and pin to top right" },
      { "gr", "<cmd>Lspsaga finder ref<CR>",                      desc = "Show symbol references" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>",                 desc = "Peek definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>",                 desc = "Go to definition" },
      { "gy", "<cmd>Lspsaga peek_type_definition<CR>",            desc = "Peek type definition" },
      { "gf", "<cmd>Lspsaga code_action<CR>",                     desc = "Code action" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>",           desc = "Show line diagnostics" },
      { "gB", "<cmd>Lspsaga show_buf_diagnostics<CR>",            desc = "Show buffer diagnostics" },
      { "gw", "<cmd>Lspsaga show_workspace_diagnostics<CR>",      desc = "Show workspace diagnostics" },
      { "go", "<cmd>Lspsaga outline<CR>",                         desc = "Show outline" },
      { "==", function() vim.lsp.buf.format { async = true } end, desc = "Format buffer" },
    },
    dependencies = {
      {
        "nvimdev/lspsaga.nvim",
        opts = {
          finder_action_keys = {
            open = 'o',
            vsplit = 's',
            split = 'i',
            quit = 'q',
            scroll_down = '<C-f>',
            scroll_up = '<C-b>'
          },
        }
      },
      "nvim-tree/nvim-web-devicons",
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
        "smjonas/inc-rename.nvim",
        config = true,
        keys = {
          { "<Leader>rn", ":IncRename ", desc = "Rename variable" },
        }
      },
    },
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
        javascriptreact = true,
        typescriptreact = true,
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

  -- diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      "gw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "List workspace diagnostics"
    }
  },

  -- special neovim lsp
  {
    "folke/neodev.nvim",
    ft = "lua",
    config = true
  }
}
