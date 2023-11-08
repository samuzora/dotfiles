-- setup order:
-- 1. mason
-- 2. mason-lspconfig
-- 3. nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  lazy = false, -- NEVER set to true - it breaks single_file_mode!!
  dependencies = {

    {
      "williamboman/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
        {
          "williamboman/mason.nvim",
          cmd = { "Mason", "MasonInstall", "MasonUninstall" },
          config = function()
            require("mason").setup()
          end,
          opts = {
            ui = {
              border = "rounded"
            }
          },
        },
      }
    },

    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    -- border
    require("lspconfig.ui.windows").default_options.border = "rounded"
    -- configure file watch (for lagging lsp servers)
    local FSWATCH_EVENTS = {
      Created = 1,
      Updated = 2,
      Removed = 3,
      -- Renamed
      OwnerModified = 2,
      AttributeModified = 2,
      MovedFrom = 1,
      MovedTo = 3
      -- IsFile
      -- IsDir
      -- IsSymLink
      -- Link
      -- Overflow
    }

    --- @param data string
    --- @param opts table
    --- @param callback fun(path: string, event: integer)
    local function fswatch_output_handler(data, opts, callback)
      if not data then
        return
      end
      local d = vim.split(data, '%s+')
      local cpath = d[1]

      for i = 2, #d do
        if d[i] == 'IsDir' or d[i] == 'IsSymLink' or d[i] == 'PlatformSpecific' then
          return
        end
      end

      if opts.include_pattern and opts.include_pattern:match(cpath) == nil then
        return
      end

      if opts.exclude_pattern and opts.exclude_pattern:match(cpath) ~= nil then
        return
      end

      for i = 2, #d do
        local e = FSWATCH_EVENTS[d[i]]
        if e then
          callback(cpath, e)
        end
      end
    end

    local function fswatch(path, opts, callback)
      local obj = vim.system({
        'fswatch',
        '--recursive',
        '--event-flags',
        '--exclude', '/.git/',
        path
      }, {
        stdout = function(_, data)
          if not data then
            return
          end
          for line in vim.gsplit(data, '\n', { plain = true, trimempty = true }) do
            fswatch_output_handler(line, opts, callback)
          end
        end
      })

      return function()
        obj:kill(2)
      end
    end

    if vim.fn.executable('fswatch') == 1 then
      require('vim.lsp._watchfiles')._watchfunc = fswatch
    end

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
      pyright = {
        single_file_support = true,
      },
      typst_lsp = {
        single_file_support = true,
        settings = {
          exportPdf = "never",
        }
      },
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
