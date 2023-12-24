return {
  -- better tsserver
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup {
        settings = {
          expose_as_code_action = "all",
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          }
        }
      }
    end
  },

  -- to lint whole workspace
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {}
  },

  -- typescript import cost
  {
    "barrett-ruth/import-cost.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    build = 'sh install.sh yarn',
    config = true
  },

  -- tsx tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
    config = true,
  },

  -- pretty typescript diagnostics
  {
    "cseickel/diagnostic-window.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "g?", vim.cmd.DiagWindowShow, desc = "Diagnostic window" },
    },
    config = true,
  },

}
