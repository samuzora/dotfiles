return {
  -- neorg
  {
    "nvim-neorg/neorg",
    config = function()
      require "neorg".setup {
        load = {
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                todo = "~/todo"
              },
              autochdir = true,
            },
          },
          ["core.qol.toc"] = {},
        },
      }
    end,
    ft = { "norg" },
  },

  -- markdown
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   ft = { "markdown" },
  --   keys = {
  --     { "<leader>md", "<cmd>MarkdownPreviewToggle", desc = "Toggle markdown preview in browser" }
  --   }
  -- }
}
